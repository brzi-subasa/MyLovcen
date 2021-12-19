//
//  UIViewController+Progressable.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/30/21.
//

import Foundation
import MBProgressHUD

public extension Progressable where Self: UIViewController {

    private var _hudParentView: UIView {
        return view
    }

    // MARK: - Public methods -

    // MARK: - Show/hide

    func showLoading() {
        showLoading(blocking: true)
    }

    func hideLoading() {
        hideLoading(blocking: true)
    }

    // MARK: - Show/hide with blocking state

    func showLoading(blocking: Bool) {
        // Remove previously added so we don't need to take care about
        // multiple async calls to show loading
        MBProgressHUD.hide(for: _hudParentView, animated: true)
        let hud = MBProgressHUD.showAdded(to: _hudParentView, animated: true)
        hud.isUserInteractionEnabled = blocking
    }

    func hideLoading(blocking: Bool) {
        _stopRefreshingIfNeeded()
        MBProgressHUD.hide(for: _hudParentView, animated: true)
    }

    // MARK: - Failure handling

    func showFailure(with error: Error) {
        showFailure(with: nil, message: error.localizedDescription)
    }

    func showFailure(with title: String?, message: String?) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertView, animated: true)
    }

    // MARK: - Private methods

    private func _stopRefreshingIfNeeded() {
        (self as? Refreshable)?.endRefreshing()
    }

}
