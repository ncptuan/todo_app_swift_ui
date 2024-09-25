//
//  task_priority.enum.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation
import Foundation
import SwiftUI


enum TaskPriority:  Decodable {
    case low
    case medium
    case high
    case unknown(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue.lowercased() {
        case "low":
            self = .low
        case "medium":
            self = .medium
        case "high":
            self = .high
       
        default:
            self = .unknown(rawValue)
        }
    }
}

