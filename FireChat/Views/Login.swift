//
//  Login.swift
//  FireChat
//
//  Created by Kushagra Sharma on 09/07/21.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var sessionSession = SessionStore()
    init(){
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        
    }
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color("Color1").ignoresSafeArea()
                    VStack {
                        Spacer()
                            .frame(height:50)
                        Text("RocketChat")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                                .frame(height: 80)
                        Image("shuttle")
                            .padding()
                            .frame(width: 200, height: 200, alignment: .center)
                        Spacer()
                                .frame(height: 80)
                        TextField("Email", text: $email)
                            .padding(10)
                            .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            
                        SecureField("Password", text: $password)
                            .padding(10)
                            .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        Spacer()
                                
                            
                            
                        
                        HStack {
                            FullwidthButton(label: "Log in", action: {
                                sessionSession.signIn(email: email, password: password)
                            })
                            FullwidthButton(label: "Sign up", action: {
                                sessionSession.signUp(email: email, password: password)
                            })
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .navigationBarHidden(true)
                    
                        
                    
                
                }
                
            }
            
            
        }
        
    }


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
