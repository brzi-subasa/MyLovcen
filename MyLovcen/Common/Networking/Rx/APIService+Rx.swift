//
//  APIService+Rx.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/28/21.
//

import Foundation
import RxSwift
import Alamofire

public extension Reactive where Base: APIServiceable {

    func request<T: Decodable>(
        _: T.Type,
        keyPath: String? = nil,
        decoder: JSONDecoder = JSONDecoder(),
        router: Routable,
        session: Session
    ) -> Single<T> {
        return Single<T>.create { [weak base] single -> Disposable in
            let request = base?.request(
                T.self,
                keyPath: keyPath,
                decoder: decoder,
                router: router,
                session: session,
                completion: { single($0.toSingleEvent) }
            )
            return Disposables.create { request?.cancel() }
        }
    }

    func requestCompletion(
        router: Routable,
        session: Session
    ) -> Completable {
        return Completable.create { [weak base] completable -> Disposable in
            let request = base?.requestCompletion(
                router: router,
                session: session,
                completion: { completable($0.toCompletableEvent) }
            )
            return Disposables.create { request?.cancel() }
        }
    }

}
