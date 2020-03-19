//
//  SingUpView.swift
//  NotesApp
//
//  Created by Анастасия Траверсе on 18.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct SingUpView: View{
    @State var emailSingUp    :String = ""
    @State var nameSingUp     :String = ""
    @State var passwordSingUp :String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack(spacing: 10){
            Text("Sign Up")
                .font(.system(size:40))
            TextField("Name", text: $nameSingUp)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            TextField("Login/E-mail", text: $emailSingUp)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            SecureField("Password", text: $passwordSingUp)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            Button(action: {
                print("Add to DB")
                print(self.emailSingUp)
                print(self.passwordSingUp)
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Sign UP")
            }
                .padding(20)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(12)
            
        }
    }
}
