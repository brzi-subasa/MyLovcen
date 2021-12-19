//
//  AlbumRouter.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/29/21.
//

import Foundation

class AlbumRouter: Router {

    public static func get() -> Router {
        Router(
            path: "albums",
            method: .get
        )
    }
}
