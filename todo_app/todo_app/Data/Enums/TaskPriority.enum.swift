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
    
    enum CodingKeys: String, CodingKey {
        case low
        case medium
        case high
        case unknown
    }
    
    
    
    var displayName: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        case .unknown:
            return "Unknown"
        }
    }
}

extension TaskPriority: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(TaskPriority.low, forKey: .low)
        try container.encode(TaskPriority.medium, forKey: .medium)
        try container.encode(TaskPriority.high, forKey: .high)
    }
}

