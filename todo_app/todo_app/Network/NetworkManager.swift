//
//  NetWorkManager.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation


import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession

    private init() {
        self.session = URLSession(configuration: URLSessionConfiguration.custom)
    }

    // Generic function for making API requests
    func request<T: Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "dataNilError", code: -100001, userInfo: nil)
                completion(.failure(error))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        task.resume()
    }
}
