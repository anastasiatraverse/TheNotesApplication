//
//  UserProfileView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    
    // To Do - get user info from SING UP VIEW or Facebook
    
    @State var userName     :String = ""
    @State var userEmail    :String = ""
    @State var userBirthday :String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50.0, height: 50.0)
            Text("User Name").font(.system(size:35)).padding(5)
            Text("User Email").font(.system(size:30)).padding(5)
            Text("User Birthday").font(.system(size:30)).padding(5)
        }
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
