//
//  InitialWireframeInitializer.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/29/21.
//

import UIKit

public protocol AppWindowHandler: AnyObject {
    var window: UIWindow? { get set }
}

public struct InitialWireframeInitializer: Initializable {

    weak var windowHandler: AppWindowHandler?

    public init(windowHandler: AppWindowHandler?) {
        self.windowHandler = windowHandler
    }

    public func initialize() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = createIntroViewController()
        window.makeKeyAndVisible()
        windowHandler?.window = window
    }

}

private extension InitialWireframeInitializer {

    func createIntroViewController() -> UIViewController {
        let wireframe = AlbumsWireframe()
        let navigationController = BaseNavigationController(rootViewController: wireframe.viewController)
        return navigationController
    }

}
