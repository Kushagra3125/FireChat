//
//  ChatList.swift
//  FireChat
//
//  Created by Kushagra Sharma on 09/07/21.
//

import SwiftUI

struct ChatList: View {
    @ObservedObject var session = SessionStore()
    @ObservedObject var viewModel = ChatroomsViewModel()
    @State var joinModal = false
    @State var isAnon = true
    
    init() {
        viewModel.fetchData()
        print(viewModel.chatrooms)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.chatrooms) { chatroom in
                NavigationLink(destination: Messages(chatroom: chatroom)) {
                    HStack {
                        VStack {
                            Text(chatroom.title)
                        }
                        Spacer()
                    }
                }
                .navigationBarTitle("Chatrooms")
                .navigationBarItems(trailing: Button(action: {
                    self.joinModal = true
                }, label: {
                    Image(systemName: "plus")
                }))
                .navigationBarItems(leading: Button(action: {
                    session.isAnon = false
                    session.signOut()
                }, label: {
                    Text("LogOut")
                }))
                
                .sheet(isPresented: $joinModal, content: {
                    Join(isOpen: $joinModal)
                })
            }
            
            
        }
        
    }
    
}


struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
