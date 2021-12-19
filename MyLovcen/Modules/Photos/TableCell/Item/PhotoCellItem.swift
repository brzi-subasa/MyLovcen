//
//  PhotoCellItem.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit

class PhotoCellItem: TableCellItem {

    let title: String
    let thumbnailUrl: String

    init(title: String, thumbnailUrl: String) {
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: PhotoTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }
}
