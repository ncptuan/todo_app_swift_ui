//
//  CreateTaskRequest.swift
//  todo_app
//
//  Created by Mac on 26/09/2024.
//

import Foundation


struct CreateTaskRequest: Codable {
    let title: String?
    let description: String?
    let taskPriority: TaskPriority?
    
}
