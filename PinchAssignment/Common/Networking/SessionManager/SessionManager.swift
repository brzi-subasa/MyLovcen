//
//  SessionManager.swift
//  PinchAssignment
//
//  Created by Andrija Scepanovic on 9/28/21.
//

import Foundation
import Alamofire
import UIKit

public class SessionManager {
    // MARK: - Public properties

    /// Shared networking manager
    public static let `default` = SessionManager()

    /// Authorization adapter will be prefixed to all requests
    public var authorizationAdapter: RequestInterceptor?

    /// Alamofire Session storage
    public private(set) lazy var session: Session = {
        return Session(
            configuration: defaultConfiguration,
            interceptor: interceptor,
            serverTrustManager: trustManager,
            eventMonitors: eventMonitors
        )
    }()

    private init() { }
}

// MARK: - Private inits

private extension SessionManager {

    // Set up custom session configuration, for example: Loggie usage.
    var defaultConfiguration: URLSessionConfiguration {
        let configuration: URLSessionConfiguration = .default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        return configuration
    }

    // In Alamofire 5 interceptor became a let constant which is passed on session init.
    // In that case we create authorization adapter on session manager which will
    // be passed when user logs in.
    var interceptor: Adapter {
        return Adapter { [weak self] (request, session, completion) in
            guard let authorizationAdapter = self?.authorizationAdapter else {
                completion(.success(request))
                return
            }
            authorizationAdapter.adapt(request, for: session, completion: completion)
        }
    }

    // In case you need a SSL pinning here is the place to do it.
    var trustManager: ServerTrustManager {
        return ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [:])
    }

    // Here you can add custom event monitors like loggers.
    var eventMonitors: [EventMonitor] {
        var monitors = [EventMonitor]()
        monitors.append(AlamofireConsoleLogger())
        return monitors
    }
}
