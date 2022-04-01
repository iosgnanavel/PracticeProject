//
//  MockUserAPI.swift
//  PracticeProjectTests
//
//  Created by Gnanavel on 01/04/22.
//

import Foundation
@testable import PracticeProject

/// MockUserAPI is mock api for testing the user api
class MockUserAPI: API {
    let mockUserList: [UserModel]?
    
    /// Initializer of MockUserAPI
    /// - Parameter userList: Mock User List
    init(userList: [UserModel]? = []) {
        self.mockUserList = userList
    }
    
    /// Getting the response from mock user API's
    /// - Parameters:
    ///   - excludingUserWithID: It is exclude the user from local mock user list
    ///   - success: get the user list from local mock user list
    ///   - failure: get the error
    func fetchUsers(excludingUserWithID: String?, success: @escaping (UsersList?) -> Void, failure: @escaping (FetchError?) -> Void) {
        guard let data = mockUserList else {
            return failure("No List Found")
        }
        // Return the list to the caller in reverse order
        var users: [UserModel] = data.reversed()
        // Remove the excluding UserID from the user response
        if let excludeUserID = Int(excludingUserWithID ?? "") {
            users.removeAll(where: {$0.id == excludeUserID})
        }
        success(users)
    }
}
