//
//  SingInView.swift
//  NotesApp
//
//  Created by Анастасия Траверсе on 18.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//
import SwiftUI

struct SingInView: View{
    @State private var isSingUp      = false
    @State private var isSingIn      = false
    @State private var isSingInAlert = false
    
    @State var login:String    = ""
    @State var password:String = ""
    
    
    
    var body: some View{
        VStack(spacing: 10){
            Text("Sign In")
                .font(.system(size:40))
                .padding(5)
            
            TextField("Login/Email", text: $login)
                .padding(5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding(5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.isSingInAlert = true
            }){
                Text("SIGN IN")
            }
                .alert(isPresented: $isSingInAlert, content: { () -> Alert in
                    Alert(title: Text("Ooooops"), message: Text("You Should enter \n Login and Password"), dismissButton: .default(Text("Ok"))
                )})
                .padding(20)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(12)
            
            Button(action:{
                print("Button clicked 2")
                self.isSingUp.toggle()
            }){
                Text("SIGN UP")
            }.sheet(isPresented: $isSingUp){
                SingUpView()
            }
                .padding(20)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(12)
        }
    }
}
