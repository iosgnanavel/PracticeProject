//
//  UserAPI.swift
//  PracticeProject
//
//  Created by Gnanavel on 31/03/22.
//

import Foundation

class UserAPI : API {
    
    private let apiBaseURL = "https://jsonplaceholder.typicode.com"
    
    required init() {
        
    }
    
    func fetchUsers(success: @escaping (UsersList?) -> Void, failure: @escaping (FetchError?) -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            failure(APIError("Check your network connection, please try again."))
            return
        }
        guard let url = URL(string: "\(apiBaseURL)/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                failure(APIError("\(error?.localizedDescription ?? "No Data Found")"))
                return
            }
            do {
                // Swift's Decoding Custom Type to deserialize the JSON response
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                
                success(users)
            } catch(let error) {
                failure(APIError("Data is invalid: \(error.localizedDescription)"))
            }
        }.resume()
    }
}
