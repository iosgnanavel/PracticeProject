//
//  API.swift
//  API
//

import Foundation

/// It is API protocol used for common Api handling
protocol API {
    init()
    /// Getting the response from user API's
    /// - Parameter complitionHandler: Getting the success response of user list and failure response of error message
    func fetchUsers(complitionHandler: @escaping (_ response: UsersList?,_ error: FetchError?) -> Void)
}
extension API {
    static func make() -> API {
        return self.init()
    }
}
typealias UsersList = [UserModel]

typealias FetchError = APIError
