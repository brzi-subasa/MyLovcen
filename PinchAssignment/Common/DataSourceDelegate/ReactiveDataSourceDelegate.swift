//
//  ReactiveDataSourceDelegate.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: TableDataSourceDelegate {

    var items: Binder<[TableCellItem]?> {
        Binder(base) { dataSourceDelegate, items in
            dataSourceDelegate.items = items
        }
    }

    var sections: Binder<[TableSectionItem]?> {
        Binder(base) { dataSourceDelegate, sections in
            dataSourceDelegate.sections = sections
        }
    }
}
