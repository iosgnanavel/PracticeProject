//
//  UserAPI.swift
//  PracticeProject
//
//  Created by Gnanavel on 31/03/22.
//

import Foundation

class UserAPI : API {
    
    private let apiBaseURL = "https://jsonplaceholder.typicode.com"
    
    func fetchUsers(excludingUserWithID: String?, success: @escaping (UsersList?) -> Void, failure: @escaping (FetchError?) -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            failure("Check your network connection, please try again.")
            return
        }
        guard let url = URL(string: "\(apiBaseURL)/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                failure("\(error?.localizedDescription ?? "No Data Found")")
                return
            }
            do {
                // Swift's Decoding Custom Type to deserialize the JSON response
                var users = try JSONDecoder().decode([UserModel].self, from: data)
                // Return the list to the caller in reverse order
                users = users.reversed()
                // Remove the excluding UserID from the user response
                if let excludeUserID = Int(excludingUserWithID ?? "") {
                    users.removeAll(where: {$0.id == excludeUserID})
                }
                DispatchQueue.main.async {
                    success(users)
                }
            } catch(let error) {
                failure("Data is invalid: \(error.localizedDescription)")
            }
        }.resume()
    }
}
