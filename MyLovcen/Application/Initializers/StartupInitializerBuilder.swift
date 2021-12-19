//
//  StartupInitializerBuilder.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/29/21.
//

import Foundation

final class StartupInitializersBuilder {

    private weak var appDelegate: AppDelegate?

    private var isTestBuild: Bool {
        #if Development
        return true
        #else
        return false
        #endif
    }

    func setAppDelegate(_ delegate: AppDelegate) -> StartupInitializersBuilder {
        appDelegate = delegate
        return self
    }

    func build() -> [Initializable] {

        let screenInitializers: [Initializable] = [
            InitialWireframeInitializer(windowHandler: appDelegate)
        ]

        return screenInitializers
    }

}
