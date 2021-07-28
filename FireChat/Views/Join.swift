//
//  Join.swift
//  FireChat
//
//  Created by Kushagra Sharma on 09/07/21.
//

import SwiftUI

struct Join: View {
    @Binding var isOpen: Bool
    @State var joinCode = ""
    @State var newTitle = ""
    @ObservedObject var viewModel = ChatroomsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Join a chatroom")
                        .font(.title)
                    TextField("Enter your join code", text: $joinCode)
                        .padding(10)
                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                        .cornerRadius(8)
                        .padding(.horizontal,40)
                    Button(action: {
                        viewModel.joinChatroom(code: joinCode, handler: {
                            self.isOpen = false
                        })
                    }, label: {
                        Text("Join")
                    })
                }
                .padding(.bottom)
                Spacer()
                    .frame(height:80)
                VStack {
                    Text("Create a chatroom")
                        .font(.title)
                    TextField("Enter a new title", text: $newTitle)
                        .padding(10)
                        .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                        .cornerRadius(8)
                        .padding(.horizontal,40)
                    Button(action: {
                        viewModel.createChatroom(title: newTitle, handler: {
                            self.isOpen = false
                        })
                            
                    }, label: {
                        Text("Create")
                    })
                }
                .padding(.top)
            }
                .navigationBarTitle("Join or create")
        }
    }
}

struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(isOpen: .constant(true))
    }
}
