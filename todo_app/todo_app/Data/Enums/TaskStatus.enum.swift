//
//  TaskStatus.enum.swift
//  todo_app
//
//  Created by Mac on 24/09/2024.
//

import Foundation

enum TaskStatus: Decodable {
    case open
    case inProgress
    case done
    case unknown(String)
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        switch rawValue.lowercased() {
        case "open":
            self = .open
        case "in_progress":
            self = .inProgress
        case "done":
            self = .done
       
        default:
            self = .unknown(rawValue)
        }
    }
    
    var displayName: String {
        switch self {
        case .open:
            return "Open"
        case .inProgress:
            return "In progress"
        case .done:
            return "Done"
        case .unknown:
            return "Unknown"
        }
    }
}
