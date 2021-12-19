//
//  TitleTableViewCell.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    // MARK: - IB Outlets -

    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - LifeCycle Methods -

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: - Configuration -

    func configureUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 14)
    }

    func configure(with item: TitleCellItem) {
        titleLabel.text = item.title
    }

}
