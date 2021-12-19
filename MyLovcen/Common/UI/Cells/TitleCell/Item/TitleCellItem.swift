//
//  TitleCellItem.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit
import RxSwift
import RxRelay

class TitleCellItem: TableCellItem {

    // MARK: - Public properties

    let title: String
    let albumId: Int
    let didSelect: PublishRelay<Int>

    // MARK: - Lifecycle methods

    init(
        albumId: Int,
        title: String,
        didSelect: PublishRelay<Int>
    ) {
        self.albumId = albumId
        self.title = title
        self.didSelect = didSelect
    }

    // MARK: - TableCellItem methods

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: TitleTableViewCell.self, for: indexPath)
        cell.configure(with: self)
        return cell
    }

    func didSelect(at indexPath: IndexPath) {
        didSelect.accept(albumId)
    }
}
