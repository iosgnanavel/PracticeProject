//
//  API.swift
//  API
//

import Foundation

/// It is API protocol used for common Api handling
protocol API {
    
    /// Getting the response from user API's
    /// - Parameters:
    ///   - excludingUserWithID: It is exclude the user from user list
    ///   - success: get the user list response
    ///   - failure: get the error message
    func fetchUsers(excludingUserWithID: String?, success: @escaping (UsersList?) -> Void, failure: @escaping (FetchError?) -> Void)
}

typealias UsersList = [UserModel]

typealias FetchError = String
