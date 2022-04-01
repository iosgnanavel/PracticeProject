//
//  UserViewModelTests.swift
//  PracticeProjectTests
//
//  Created by Gnanavel on 01/04/22.
//

import XCTest
@testable import PracticeProject

class UserViewModelTests: XCTestCase {
    // User View Model for testing
    var userViewModel: UserViewModel?
    // Mock User API
    var mockUserAPI: MockUserAPI?
    // Mock usermodels
    var mockList = [UserModel]()
    
    /// setup the test case objects
    override func setUpWithError() throws {
        mockList.append(UserModel.init(id: 100, name: "Gnana", email: "gnana@gmail.com", address: AddressModel.init(city: "City Name"), company: CompanyModel.init(name: "Company Name")))
        mockList.append(UserModel.init(id: 101, name: "Gnana2", email: "gnana2@gmail.com", address: AddressModel.init(city: "City Name"), company: CompanyModel.init(name: "Company Name")))
        mockUserAPI = MockUserAPI.init(userList: mockList)
        if let mock = mockUserAPI {
            userViewModel = UserViewModel.init(request: mock)
        }
    }
    /// teardown the objects
    override func tearDownWithError() throws {
        userViewModel = nil
        mockUserAPI = nil
    }
    
    func testUserViewModelSuccessFetchUserList() throws {
        userViewModel?.loadData(excludingUserWithID: "")
        
        XCTAssertGreaterThan(userViewModel?.userList.count ?? 0, 1, "NO User Found")
    }
    func testUserViewModelUserListWithExcludingOneUser() throws {
        userViewModel?.loadData(excludingUserWithID: "100")
        
        XCTAssertEqual(userViewModel?.userList.count ?? 0, 1, "Not Excluded the user id 100")
    }
    func testUserViewModelUserListIsReversed() throws {
        userViewModel?.loadData(excludingUserWithID: "")
        print("mockList.reversed(): \(mockList.reversed())")
        print("mockList.reversed(): \((userViewModel?.userList ?? []))")
        if mockList.reversed() != (userViewModel?.userList ?? []) {
            XCTFail("Should Equal after reversed")
        }
    }
}
