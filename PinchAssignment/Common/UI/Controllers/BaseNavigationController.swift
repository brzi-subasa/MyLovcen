//
//  BaseNavigationController.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/29/21.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = false
        navigationBar.backgroundColor = .red
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIColor.red.image(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
