//
//  SingUpView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI
import CoreData

struct SingUpView: View{
    
    // -- Connect CoreData
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var emailSingUp    :String = ""
    @State var nameSingUp     :String = ""
    @State var passwordSingUp :String = ""
    
    
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
                let newUser = User(context: self.moc)
                newUser.email    = self.emailSingUp
                newUser.name     = self.nameSingUp
                newUser.password = self.passwordSingUp
                try? self.moc.save()
                
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
