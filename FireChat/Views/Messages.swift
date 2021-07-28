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
                Text("Join Code: \(String(chatroom.joinCode))")
                    .bold()
                List(viewModel.messages) { message in
                    HStack {
                            
                        if message.name == Auth.auth().currentUser!.email{
                            
                            RightMessage(content: message.content, name: message.name)
                                
                                
                        }
                        else{
                            LeftMessage(content: message.content, name: message.name)
                            
                        }
                        
                        }
                        
                }
                
                .listStyle(PlainListStyle())
                .buttonStyle(NoButtonStyle())
                }
            HStack {
                TextField("Enter message...", text: $messageField)
                    .padding(10)
                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(25)
                    .foregroundColor(Color.black)
                Button(action: {
                    if messageField != ""{
                        viewModel.sendMessage(messageContent: messageField, docId: chatroom.id)}
                        messageField = ""
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                })
            }
        
        
            .padding(.horizontal)
            .navigationBarTitle(String(chatroom.title))
    }
        
    }


struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages(chatroom: Chatroom(id: "10101", title: "Hello!", joinCode: 10))
    }
}



struct RightMessage: View {
    let content:String
    let name:String
    var body: some View {
    HStack {
        Spacer()
        VStack (alignment:.trailing){
                    Text(content)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    Text(name)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
            }
        }
    }
}





struct LeftMessage: View {let content:String
    let name:String
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                        Text(content)
                            .padding(10)
                            .background(Color.gray)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                        Text(name)
                            .font(.system(size: 13))
                            .foregroundColor(.secondary)
                }
            Spacer()
            }
        }
    }


struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    

}

struct NoButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
    
}
