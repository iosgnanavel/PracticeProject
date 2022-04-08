//
//  APIError.swift
//  PracticeProject
//
//  Created by Gnanavel on 06/04/22.
//

import Foundation

/// API Error with more specific error type
enum APIError: Error {
    
    case network(description: String) // Network issue
    case invalidData(description: String) // Response data is invalid or empty
    case decoding(description: String) // Response data decoding error like jsondecoding
    case unexpected(code: Int) // Unexpected error when data and error is nil
}
extension APIError {
    
    /// LocalizedDescription is used to get the error message
    var localizedDescription: String {
        switch self {
        case .network(description: let description):
            return description
        case .invalidData(description: let description):
            return description
        case .decoding(description: let description):
            return "Decoding Error: \(description)"
        case .unexpected(_):
            return "An unexpected error occurred."
        }
    }
}
