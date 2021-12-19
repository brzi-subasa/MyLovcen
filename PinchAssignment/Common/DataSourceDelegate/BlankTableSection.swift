//
//  BlankTableSection.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit

/// Represents blank section - without header or footer
///
/// Used in conjuction with table view data source delegate
/// for easy mapping items to single section without footer
/// or header - just like you didn't use section at all.
class BlankTableSection: TableSectionItem {

    var items: [TableCellItem]

    init(items: [TableCellItem]) {
        self.items = items
    }

    convenience init?(items: [TableCellItem]?) {
        guard let items = items else {
            return nil
        }
        self.init(items: items)
    }

    var headerHeight: CGFloat {
        .leastNonzeroMagnitude
    }

    var footerHeight: CGFloat {
        .leastNonzeroMagnitude
    }

    var estimatedHeaderHeight: CGFloat {
        headerHeight
    }

    var estimatedFooterHeight: CGFloat {
        footerHeight
    }

}
