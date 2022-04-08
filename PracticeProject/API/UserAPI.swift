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
    
    func fetchUsers(complitionHandler: @escaping (UsersList?, FetchError?) -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            complitionHandler(nil, .network(description: "Check your network connection, please try again."))
            return
        }
        guard let url = URL(string: "\(apiBaseURL)/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Error
            if let errorResponse = error {
                complitionHandler(nil, .network(description: errorResponse.localizedDescription))
                return
            }
            // HTTP response
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                complitionHandler(nil, .unexpected(code: httpResponse.statusCode))
                return
            }
            // Data
            guard let data = data else {
                complitionHandler(nil, .invalidData(description: "Invalid Data"))
                return
            }
            do {
                // Swift's Decoding Custom Type to deserialize the JSON response
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                if users.count > 0 {
                    complitionHandler(users, nil)
                } else {
                    complitionHandler(nil, .invalidData(description: "No Data Found"))
                }
            } catch(let error) {
                complitionHandler(nil, .decoding(description: error.localizedDescription))
            }
        }.resume()
    }
}
