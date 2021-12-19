//
//  Photo.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import Foundation

struct PhotoModel: Codable {
    let albumId: Int
    let photoId: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case photoId =  "id"
        case albumId, title, url, thumbnailUrl
    }
}
