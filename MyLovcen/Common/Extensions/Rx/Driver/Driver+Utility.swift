//
//  Driver+Utility.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import RxCocoa

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {

    func mapTo<T>(_ elem: T) -> Driver<T> {
        map { _ in elem }
    }

    func mapToVoid() -> Driver<Void> {
        mapTo(())
    }

    func flatMapTo<T>(_ elem: Driver<T>) -> Driver<T> {
        flatMap { _ in elem }
    }

    public func wrap() -> Driver<Element?> {
        map(Swift.Optional.some)
    }
}
