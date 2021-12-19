//
//  AlbumModel.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/29/21.
//

import Foundation

struct Album: Codable {
    public var albumId: Int
    public let userId: Int
    public let title: String

    enum CodingKeys: String, CodingKey {
        case albumId = "id"
        case userId, title
    }
}
