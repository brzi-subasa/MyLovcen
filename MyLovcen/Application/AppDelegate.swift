//
//  AppDelegate.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 9/28/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AppWindowHandler {

    var window: UIWindow?

    private var initializers: [Initializable] = [] {
        didSet { initializers.forEach { $0.initialize() } }
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        initializers = StartupInitializersBuilder()
            .setAppDelegate(self)
            .build()

        return true
    }
}
