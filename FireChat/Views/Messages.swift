//
//  Messages.swift
//  FireChat
//
//  Created by Kushagra Sharma on 09/07/21.
//

import SwiftUI
import Firebase

struct Messages: View {
    let chatroom: Chatroom
    @ObservedObject var viewModel = MessagesViewModel()
    @State var messageField = ""
    @State var isCurrentUser :Bool = true
    
    
    init(chatroom: Chatroom) {
        self.chatroom = chatroom
        viewModel.fetchData(docId: chatroom.id)
    }
    
    var body: some View {
        VStack {
            
            List(viewModel.messages) { message in
                HStack {
                        
                    if message.name == Auth.auth().currentUser!.email{
                        VStack (alignment: .trailing, content: {
                            Text(message.content)
                                .padding()
                                .font(.system(size: 20))
                            Text(message.name)
                                .font(.system(size: 10))
                            Spacer()
                        })
                    }
                    else{
                        
                    }
                    }
                    
                }
            }
            HStack {
                TextField("Enter message...", text: $messageField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.sendMessage(messageContent: messageField, docId: chatroom.id)
                }, label: {
                    Text("Send")
                })
            }
            .navigationBarTitle(String(chatroom.joinCode))
        }
            
    }


struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages(chatroom: Chatroom(id: "10101", title: "Hello!", joinCode: 10))
    }
}


