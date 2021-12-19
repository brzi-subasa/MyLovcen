//
//  PaginationResponse.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import Foundation

struct PaginationResponse<T: Codable> {
    var data: [T]
    var page: Int

    init(data: [T], page: Int) {
        self.data = data
        self.page = page
    }

    public var isFirstPage: Bool {
        // 1 represents first page on API side
        return page < 2
    }
}

extension PaginationResponse {

    static func empty() -> PaginationResponse {
        return PaginationResponse(data: [], page: 1)
    }

    public func nextPage() -> Int {
        return page + 1
    }

}
