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
    init(request: API = UserAPI.make()) {
        self.request = request
    }
    
    /// Getting the user list from API response
    /// - Parameter excludingUserWithID: It is excluding the selected user
    func loadData(excludingUserWithID: String) {
        self.loading = true
        request.fetchUsers { [weak self] response, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.loading = false
                if var data = response {
                    self.errorMessage = ""
                    // Return the list to the caller in reverse order
                    data = data.reversed()
                    // Remove the excluding UserID from the user response
                    if let excludeUserID = Int(excludingUserWithID) {
                        data.removeAll(where: {$0.id == excludeUserID})
                    }
                    self.userList = data
                } else if let error = error {
                    self.errorMessage = error.localizedDescription
                    self.userList = []
                }
            }
        }
    }
}
