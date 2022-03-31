//
//  UserModel.swift
//  PracticeProject
//
//  Created by Gnanavel on 31/03/22.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable, Identifiable {
    let id: Int?
    let name, email: String?
    let address: AddressModel?
    let company: CompanyModel?
}

// MARK: - AddressModel
struct AddressModel: Codable {
    let city: String?
}

// MARK: - CompanyModel
struct CompanyModel: Codable {
    let name: String?
}
