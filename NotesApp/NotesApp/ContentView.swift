//
//  ContentView.swift
//  NotesApp
//
//  Created by Анастасия Траверсе on 17.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var login: String = ""
    @State var password: String = ""
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        VStack{
            Text("Sign In ").font(.system(size: 40)).padding()
            TextField("Login", text:$login).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Password", text:$password).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(action: {
                if(self.login.count > 0){
                    print(self.login)
                    print(self.password)
                }else{
                    self.isShowAlert = true
                }
            }, label: {
                Text("SIGN IN")
            }).alert(isPresented: $isShowAlert, content: { () -> Alert in
                Alert(title: Text("Ooooops"), message: Text("You Should enter Login and Password"), dismissButton: .default(Text("Ok"))
                )}).padding().background(Color.gray).foregroundColor(.white)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
