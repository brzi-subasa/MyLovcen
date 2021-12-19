//
//  PhotosRouter.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit
import Alamofire

class PhotosRouter: Router {

    public static func get(with albumId: Int, page: Int) -> Router {
        let params = [
            "albumId": albumId,
            "_page": page
        ]
        return Router(
            path: "photos",
            method: .get,
            encodableParams: EncodableParams(encoding: URLEncoding.default, parameters: params)
        )
    }
}
