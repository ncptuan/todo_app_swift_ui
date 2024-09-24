//
//  TaskStatus.enum.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation

enum TaskStatus: String, Decodable {
    case OPEN
    case inProgress = "IN_PROGRESS"
    case DONE
    
  
}
