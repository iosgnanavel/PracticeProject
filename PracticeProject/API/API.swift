//
//  API.swift
//  API
//

import Foundation

/// It is API protocol used for common Api handling
protocol API {
    init()
    /// Getting the response from user API's
    /// - Parameters:
    ///   - excludingUserWithID: It is exclude the user from user list
    ///   - success: get the user list response
    ///   - failure: get the APIError if get fails the api response or network issue
    func fetchUsers(success: @escaping (UsersList?) -> Void, failure: @escaping (FetchError?) -> Void)
}
extension API {
    static func make() -> API {
        return self.init()
    }
}
typealias UsersList = [UserModel]

typealias FetchError = APIError
