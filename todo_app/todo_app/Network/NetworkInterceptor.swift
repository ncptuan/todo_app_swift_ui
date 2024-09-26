//
//  NetworkInterceptor.swift
//  todo_app
//
//  Created by Mac on 26/09/2024.
//
import Foundation

class NetworkInterceptor: URLProtocol {
    private var sessionTask: URLSessionDataTask?

    override class func canInit(with request: URLRequest) -> Bool {
        return request.url?.scheme == "http" || request.url?.scheme == "https"
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        var modifiedRequest = request
        // Add custom headers or other intercepting logic
        modifiedRequest.addValue("Bearer token_value", forHTTPHeaderField: "Authorization")

        sessionTask = URLSession.shared.dataTask(with: modifiedRequest) { [weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                self.client?.urlProtocol(self, didFailWithError: error)
                return
            }

            if let response = response {
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }

            if let data = data {
                self.client?.urlProtocol(self, didLoad: data)
            }

            self.client?.urlProtocolDidFinishLoading(self)
        }
        sessionTask?.resume()
    }

    override func stopLoading() {
        sessionTask?.cancel()
    }
}
