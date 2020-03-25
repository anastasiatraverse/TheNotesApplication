//
//  Login.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FBSDKLoginKit

struct login: UIViewRepresentable {
    
    func makeCoordinator() -> login.coordinator {
        return login.coordinator()
    }
     
    func makeUIView(context: UIViewRepresentableContext<login>) -> FBLoginButton{
        let button = FBLoginButton()
        button.permissions = ["email"]
        button.delegate = context.coordinator
        return button
    }
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<login>) {
        
    }
     
    class coordinator: NSObject, LoginButtonDelegate{
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil{
                print(error?.localizedDescription as Any)
                return
            }
            
            if AccessToken.current != nil{
                let credentital = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                Auth.auth().signIn(with: credentital){
                    (res, err) in
                    if err != nil{
                        print(err?.localizedDescription as Any)
                        return
                    }
                    print("Success!")
                }
            }
        }
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth()
        }
        
    }
}
