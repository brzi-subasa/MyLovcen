//
//  PhotosPresenter.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import RxSwift
import RxCocoa

final class PhotosPresenter {

    // MARK: - Private properties -

    private unowned let view: PhotosViewInterface
    private let interactor: PhotosInteractorInterface
    private let wireframe: PhotosWireframeInterface

    // MARK: - Lifecycle -

    init(view: PhotosViewInterface, interactor: PhotosInteractorInterface, wireframe: PhotosWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension PhotosPresenter: PhotosPresenterInterface {

    func configure(with output: Photos.ViewOutput) -> Photos.ViewInput {

        let didSelectPhoto = PublishRelay<Int>()
        handle(didSelectPhoto: didSelectPhoto.asDriverOnErrorComplete())

        let photos = fetchPhotos(
            loadNextPage: output.willDisplayLastCell,
            reload: output.pullToRefresh.asDriverOnErrorComplete()
        )

        return Photos.ViewInput(items: cellItems(from: photos, didSelect: didSelectPhoto))
    }

}

// MARK: - Handlers -

extension PhotosPresenter {

    func fetchPhotos(loadNextPage: Driver<Void>, reload: Driver<Void>) -> Driver<[PhotoModel]> {
        let view = view
        return interactor
            .fetchPhotos(loadNextPage: loadNextPage, reload: reload)
            .handleLoadingAndError(with: view)
            .asDriverOnErrorComplete()
    }

    func handle(didSelectPhoto: Driver<Int>) {

    }
}

// MARK: - Helpers -

extension PhotosPresenter {

    func cellItems(from photos: Driver<[PhotoModel]>, didSelect: PublishRelay<Int>) -> Driver<[TableCellItem]> {
        let photosToItems: ([PhotoModel]) -> [TableCellItem] = {
            $0.map { PhotoCellItem(title: $0.title, thumbnailUrl: $0.thumbnailUrl) }
        }
        return photos.map(photosToItems)
    }
}