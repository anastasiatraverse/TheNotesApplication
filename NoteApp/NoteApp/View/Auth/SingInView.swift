//
//  SingInView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI
import CoreData
import Firebase
import FBSDKLoginKit


struct SingInView: View{
    @State private var isSingUp      = false
    @State private var isSingIn      = false
    @State private var isSingInAlert = false
    @State private var loged:Bool    = false
    
    @State var login:String    = ""
    @State var password:String = ""
    
    @State var userInfo: [String] = []
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView{
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
                    for i in self.users{
                        if i.email == self.login && i.password == self.password{
                            self.userInfo.append(i.name!)
                            self.userInfo.append(i.email!)
                            self.userInfo.append(i.password!)
                            self.loged.toggle()
                        }
                    }
                    if self.login.count == 0 || self.password.count == 0{
                        self.isSingInAlert.toggle()
                    }
                }){
                    Text("SIGN IN")
                }
                    .alert(isPresented: $isSingInAlert, content: { () -> Alert in
                        Alert(title: Text("Ooooops"), message: Text("You Should enter \n Login and Password"), dismissButton: .default(Text("Ok"))
                    )})
                    .padding(20)
                    .frame(width: 300, height: 60)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(12)
                
                
                NavigationLink(destination:  NotesView(userInfo: self.userInfo,manager: NoteManager()), isActive: $loged) {
                   Text("")
               }
                
                Button(action:{
                    self.isSingUp.toggle()
                }){
                    Text("SIGN UP")
                }.sheet(isPresented: $isSingUp){
                    SingUpView().environment(\.managedObjectContext, self.moc)
                }.padding(20)
                    .frame(width: 300, height: 60)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(12)
                
                Login()
                    .frame(width: 300, height: 60)
                    .cornerRadius(12)
                
                NavigationLink(destination: NotesView(userInfo: userInfo, manager: NoteManager())){
                    Text("Continue without Sing In")
                        .padding(5)
                }
                .padding(5)
                .buttonStyle(PlainButtonStyle())
                
                
                }
             .navigationBarBackButtonHidden(true)
             .navigationBarHidden(true)
        }
        
    }
}


//struct SingInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingInView()
//    }
//}

