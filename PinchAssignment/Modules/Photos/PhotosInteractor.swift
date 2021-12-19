//
//  PhotosInteractor.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/30/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class PhotosInteractor {

    // MARK: Private Properties

    private let service: APIService
    private let sessionManager: SessionManager
    private let albumId: Int

    init(
        albumId: Int,
        service: APIService = APIService.instance,
        sessionManager: SessionManager = .default
    ) {
        self.albumId = albumId
        self.service = service
        self.sessionManager = sessionManager
    }
}

// MARK: - Extensions -

extension PhotosInteractor: PhotosInteractorInterface {

    typealias Container = [PhotoModel]
    typealias Page = [PhotoModel]
    typealias PagingEvent = Paging.Event<Container>

    func fetchPhotos(loadNextPage: Driver<Void>, reload: Driver<Void>) -> Observable<[PhotoModel]> {
        let events = Driver
            .merge(
                loadNextPage.mapTo(PagingEvent.nextPage),
                reload.startWith(()).mapTo(PagingEvent.reload)
            )

        func nextPage(container: Container, lastPage: Page?, pageCount: Int) -> Single<Page> {
            let router = PhotosRouter.get(with: albumId, page: pageCount)

            return service.rx
                .request(
                    [PhotoModel].self,
                    router: router,
                    session: sessionManager.session
                )
        }

        func accumulator(_ container: Container, _ page: Page) -> Container {
            return container + page
        }

        func hasNext(container: Container, lastPage: Page) -> Bool {
            return !lastPage.isEmpty
        }

        let response = Paging
            .page(
                make: nextPage,
                startingWith: [],
                joining: accumulator,
                while: hasNext,
                on: events.asObservable()
            )
        return response.map { $0.container }
    }
}
