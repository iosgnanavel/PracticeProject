//
//  APIError.swift
//  PracticeProject
//
//  Created by Gnanavel on 06/04/22.
//

import Foundation

struct APIError: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        return message
    }
}
