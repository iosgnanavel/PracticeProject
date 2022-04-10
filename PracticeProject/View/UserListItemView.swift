//
//  UserListItemView.swift
//  PracticeProject
//
//  Created by Gnanavel on 31/03/22.
//

import SwiftUI

struct UserListItemView: View {
    // MARK: - Variables
    let userDetails: UserModel
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // MARK: ID
            HStack {
                Text("ID")
                    .font(.caption)
                    .fontWeight(.bold)
                    .frame(width: 80, alignment: .leading)
                
                Text(": \(userDetails.id ?? 0)")
                    .font(.caption)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.trailing)
            }
            // MARK: Name
            if let name = userDetails.name, name.count > 0 {
                HStack {
                    Text("Name")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)
                    
                    Text(": \(name)")
                        .font(.caption)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.trailing)
                }
            }
            // MARK: Email
            if let email = userDetails.email, email.count > 0 {
                HStack {
                    Text("Email")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)
                    
                    Text(": \(email)")
                        .font(.caption)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.trailing)
                }
            }
            // MARK: City
            if let city = userDetails.address?.city, city.count > 0 {
                HStack {
                    Text("City")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)
                    
                    Text(": \(city)")
                        .font(.caption)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.trailing)
                }
            }
            // MARK: Company Name
            if let companyName = userDetails.company?.name, companyName.count > 0 {
                HStack {
                    Text("Company")
                        .font(.caption)
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)
                    
                    Text(": \(companyName)")
                        .font(.caption)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.trailing)
                }
            }
        }//: VStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.white))
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
        )
    }
}
// MARK: - Preview
struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let userDetails = UserModel.init(id: 122,
                                         name: "Name",
                                         email: "Name@mail.com",
                                         address: AddressModel.init(city: "CityName"),
                                         company: CompanyModel.init(name: "CompanyName"))
        UserListItemView(userDetails: userDetails)
            .previewLayout(.sizeThatFits)
    }
}
