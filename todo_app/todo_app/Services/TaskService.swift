//
//  APIClient.swift
//  todo_app
//
//  Created by Mac on 26/09/2024.
//

import Foundation

final class TaskService {
    static func fetchTasks(completion: @escaping (Result<[Task], Error>) -> Void) {
        guard let url = URL(string: APIEndpoints.task) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        NetworkManager.shared.request(urlRequest: request, completion: completion)
    }

    static func createTask(task: CreateTaskRequest, completion: @escaping (Result<Task, Error>) -> Void) {
        guard let url = URL(string: APIEndpoints.createTask) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do {
            let postData = try JSONEncoder().encode(task)
            request.httpBody = postData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(.failure(error))
        }

        NetworkManager.shared.request(urlRequest: request, completion: completion)
    }
}

