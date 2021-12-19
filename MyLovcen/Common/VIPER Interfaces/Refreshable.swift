//
//  Refreshable.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import UIKit

protocol Refreshable {
    var refreshControl: UIRefreshControl { get }
}

extension Refreshable {

    func endRefreshing() {
        // Check if refresh control is refreshing before calling endRefreshing,
        // otherwise it will result in wierd glitch while scrolling and reloading
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}
