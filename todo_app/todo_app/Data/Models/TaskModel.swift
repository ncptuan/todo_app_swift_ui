//
//  TaskModel.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation

struct Task: Decodable {
    let id: String?
    let title: String?
    let description: String?
    let taskPriority: TaskPriority?
    let status: TaskStatus?
    
    
    enum CodingKeys: String, CodingKey {
            case id
            case title
            case description
            case taskPriority
            case status
        }
    
}
