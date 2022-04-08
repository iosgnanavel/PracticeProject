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
    func fetchUsers(complitionHandler: @escaping (UsersList?, FetchError?) -> Void) {
        guard let data = mockUserList else {
            complitionHandler(nil, .invalidData(description: "No Data Found"))
            return
        }
        complitionHandler(data, nil)
    }
}
