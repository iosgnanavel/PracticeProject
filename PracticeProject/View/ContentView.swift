//
//  ContentView.swift
//  PracticeProject
//
//  
//

import SwiftUI


/// It is main view of launch screen
struct ContentView: View {
    // MARK: - Variable
    @ObservedObject var viewmodel = UserViewModel() // ViewModel
    @State private var selectedUserDetails: UserModel? // Selected User Details
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if viewmodel.loading { // It is loading when getting user list from API
                    ActivityIndicator(color: Color.black, size: 50)
                } else {
                    if let selectedUser = selectedUserDetails, viewmodel.errorMessage.count < 1 { // Selected user
                        VStack(alignment: .leading, spacing: 10) {
                            // MARK: - Title of Selected User
                            Text("Selected User")
                                .multilineTextAlignment(.leading)
                                .font(.title2)
                                .foregroundColor(.black)
                            // MARK: - User Details
                            VStack(alignment: .leading, spacing: 5) {
                                if let name = selectedUser.name, name.count > 0 {
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
                                HStack {
                                    Text("ID")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(width: 80, alignment: .leading)
                                    
                                    Text(": \(selectedUser.id ?? 0)")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.trailing)
                                }// :HStack
                            }// :VStack
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                            .background(RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(.white))
                                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            )
                        }// : VStack
                        .padding(SwiftUI.EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
                    if (viewmodel.userList.count > 0) { // Excluded user list with selection option
                        // MARK: - Title of user list
                        Text("User List")
                            .multilineTextAlignment(.leading)
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(SwiftUI.EdgeInsets.init(top: 10, leading: 20, bottom: 0, trailing: 20))
                        // MARK: - User Details
                        ScrollView() {
                            LazyVStack {
                                ForEach(viewmodel.userList) { user in
                                    UserListItemView(userDetails: user)
                                        .onTapGesture {
                                            if let userID = user.id {
                                                selectedUserDetails = user
                                                self.viewmodel.loadData(excludingUserWithID: "\(userID)")
                                            }
                                        }
                                }
                                .listRowBackground(Color.clear)
                            }//: LazyVStack
                            .padding(SwiftUI.EdgeInsets.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                        }//: ScrollView
                    } else {
                        // MARK: - Error message
                        VStack(alignment: .center) {
                            Text(viewmodel.errorMessage)
                                .padding(20)
                                .multilineTextAlignment(.center)
                                .font(.title3)
                                .foregroundColor(.black)
                            Text("Retry")
                                .padding(20)
                                .multilineTextAlignment(.center)
                                .font(.title3)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    if let userID = selectedUserDetails?.id {
                                        self.viewmodel.loadData(excludingUserWithID: "\(userID)")
                                    } else {
                                        self.viewmodel.loadData(excludingUserWithID: "")
                                    }
                                }
                        }
                    }
                }
            }//: VStack
            .onAppear {
                self.viewmodel.loadData(excludingUserWithID: "")
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(Text("Assignment"))
        }//: NavigationView
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
