//
//  UserViewModel.swift
//  PracticeProject
//
//  Created by Gnanavel on 31/03/22.
//

import Foundation
import Combine


/// UserViewModel is handling the user selection functionality like api and other business logics
class UserViewModel: ObservableObject {
    @Published var userList = [UserModel]()
    @Published var loading = false
    var errorMessage: String = ""

    let request: API
    init(request: API = UserAPI()) {
        self.request = request
    }
    
    /// Getting the user list from API response
    /// - Parameter excludingUserWithID: It is excluding the selected user
    func loadData(excludingUserWithID: String) {
        self.loading = true
        request.fetchUsers(excludingUserWithID: excludingUserWithID) { userList in
            self.loading = false
            guard let users = userList else {
                self.errorMessage = "No user data found"
                self.userList = []
                return
            }
            self.errorMessage = ""
            self.userList = users
        } failure: { error in
            self.loading = false
            self.errorMessage = error?.debugDescription ?? "Something went wrong, please try again"
            self.userList = []
        }
    }
}
