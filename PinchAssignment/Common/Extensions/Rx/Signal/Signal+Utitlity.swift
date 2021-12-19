//
//  Signal+Utitlities.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import RxSwift
import RxCocoa

extension Signal {

    func asDriverOnErrorComplete() -> Driver<Element> {
        asDriver(onErrorDriveWith: .empty())
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == SignalSharingStrategy {

    func mapTo<T>(_ elem: T) -> Signal<T> {
        map { _ in elem }
    }

    func mapToVoid() -> Signal<Void> {
        mapTo(())
    }

    func flatMapTo<T>(_ elem: Signal<T>) -> Signal<T> {
        flatMap { _ in elem }
    }

    public func wrap() -> Signal<Element?> {
        map(Swift.Optional.some)
    }
}
