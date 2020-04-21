//
//  UserProfileView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI



struct UserProfileView: View {
        
    let userInfo: [String]
    let manager : NoteManager
    
    @State var userImage       :Image?  = nil
    @State var showCaptureImage: Bool   = false
    
    @State var showUserInfo: Bool = false
    @State var showNoteInfo: Bool = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, content: {
                Section{
                        if (userImage != nil){
                            userImage?
                                .resizable()
                                .frame(width:100.0, height:100.0)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        }else{
                            Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100.0, height: 100.0)
                            .gesture(
                                TapGesture().onEnded{
                                    self.showCaptureImage.toggle()
                                }
                            )
                        }
                    }
                    
                    VStack(alignment: .leading, content: {
                        HStack{
                            Text("User Info").font(.system(size:30))
                            Image(systemName: showUserInfo ? "chevron.up" : "chevron.down")
                                .resizable()
                                .frame(width:10, height: 10)
                        }.onTapGesture {
                            self.showUserInfo.toggle()
                        }
                        
                        if(showUserInfo){
                            Text("User Name:     \(self.userInfo[0])")
                                .font(.system(size:25))
                                .padding(5)
                            Text("User Email:    \(self.userInfo[1])")
                                .font(.system(size:25))
                                .padding(5)
                            Text("User Birthday: \(self.userInfo[2])")
                                .font(.system(size:25))
                                .padding(5)
                        }
                    })
                        .padding(15)
                        .background(LinearGradient(gradient: .init(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                        .animation(.spring())
                    
                    VStack(alignment: .leading, content: {
                        HStack{
                            Text("User Info").font(.system(size:30))
                            Image(systemName: showNoteInfo ? "chevron.up" : "chevron.down")
                                .resizable()
                                .frame(width:10, height: 10)
                        }.onTapGesture {
                            self.showNoteInfo.toggle()
                        }
                        if(showNoteInfo){
                            Text("Notes Info")
                                .font(.system(size:25))
                                .padding(5)
                            Text("Total Notes Number: \(manager.notes.count)")
                                .font(.system(size:25))
                                .padding(5)
                            Text("Favourite Notes   : \(manager.calculateFavourite())")
                                .font(.system(size:25))
                                .padding(5)
                            Text("Deleted Notes     : \(manager.calculateDeleted())")
                                .font(.system(size:25))
                                .padding(5)
                        }
                    })
                        .padding(15)
                        .background(LinearGradient(gradient: .init(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                        .animation(.spring())
            })
            if (showCaptureImage) {
              CaptureImageView(isShown: $showCaptureImage, image: $userImage)
            }
        }
    }
    
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView(["","",""],manager: NoteManager())
//    }
//}
