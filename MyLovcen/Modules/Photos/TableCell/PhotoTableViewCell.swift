//
//  PhotoTableViewCell.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit
import AlamofireImage

class PhotoTableViewCell: UITableViewCell {

    // MARK: - IB Outlets -

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - LifeCycle Methods -

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: - Configuration -

    func configureUI() {
        thumbnailImageView.layer.cornerRadius = 5.0
    }

    func configure(with item: PhotoCellItem) {
        titleLabel.text = item.title

        guard let imageURL = URL(string: item.thumbnailUrl) else {
            return
        }
        thumbnailImageView.af.setImage(withURL: imageURL)
    }
}
