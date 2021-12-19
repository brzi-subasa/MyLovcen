//
//  Result+Map.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/28/21.
//

import Foundation

public extension Result {

    /// Maps Result Success type to Void
    var mapToVoid: Result<Void, Failure> {
        return self.map { _ in () }
    }
}
