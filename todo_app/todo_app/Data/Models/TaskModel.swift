//
//  TaskModel.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation
import SwiftUI

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
    
//    init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            id = try container.decode(String.self, forKey: .id)
//            title = try container.decode(String.self, forKey: .title)
//            description = try container.decode(String.self, forKey: .description)
//            taskPriority = try container.decode(TaskPriority.self, forKey: .taskPriority)
//            status = try container.decode(TaskStatus.self, forKey: .status)
//        }
}
