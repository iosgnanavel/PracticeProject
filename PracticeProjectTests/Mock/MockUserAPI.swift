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
    required init() {
        
    }
    
    var mockUserList: [UserModel]?
    
    /// Initializer of MockUserAPI
    /// - Parameter userList: Mock User List
    convenience init(userList: [UserModel]? = []) {
        self.init()
        self.mockUserList = userList
    }
    
    /// Getting the response from mock user API's
    /// - Parameters:
    ///   - excludingUserWithID: It is exclude the user from local mock user list
    ///   - success: get the user list from local mock user list
    ///   - failure: get the error
    func fetchUsers(success: @escaping (UsersList?) -> Void, failure: @escaping (FetchError?) -> Void) {
        guard let data = mockUserList else {
            return failure(APIError("No List Found"))
        }
        success(data)
    }
}
