//
//  UserModelTests.swift
//  PracticeProjectTests
//
//  Created by Gnanavel on 01/04/22.
//

import XCTest
@testable import PracticeProject

class UserModelTests: XCTestCase {
    
    /// Testing the UserModel parsing from json string
    func testUserModelSuccessParser() throws {
        let jsonString = """
        [
          {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
              "street": "Kulas Light",
              "suite": "Apt. 556",
              "city": "Gwenborough",
              "zipcode": "92998-3874",
              "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
              }
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
              "name": "Romaguera-Crona",
              "catchPhrase": "Multi-layered client-server neural-net",
              "bs": "harness real-time e-markets"
            }
          }
        ]
        """.data(using: .utf8)!
        
        do {
            let users = try JSONDecoder().decode([UserModel].self, from: jsonString)
            XCTAssertNotNil(users, "User data is mismatching")
            XCTAssertTrue(users.count > 0, "User list count is empty")
            XCTAssertNotNil(users.first?.id, "User id not found")
            XCTAssertNotNil(users.first?.name, "User name not found")
            XCTAssertNotNil(users.first?.email, "User email not found")
            XCTAssertNotNil(users.first?.address?.city, "User city not found")
            XCTAssertNotNil(users.first?.company?.name, "User company name not found")
            XCTAssertNotNil(users.first?.id, "User data is mismatching")
        } catch(let errror) {
            XCTFail(errror.localizedDescription)
        }
    }
}
