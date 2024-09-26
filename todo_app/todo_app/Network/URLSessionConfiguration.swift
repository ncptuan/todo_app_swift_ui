//
//  URLSessionConfiguration.swift
//  todo_app
//
//  Created by Mac on 26/09/2024.
//

import Foundation

extension URLSessionConfiguration {
    static var custom: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.protocolClasses = [NetworkInterceptor.self] // Add interceptor here
        return config
    }
}
