//
//  NotesView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct NotesView: View {
    
    let userInfo : [String]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var manager: NoteManager
    var body: some View {
        
        TabView{
            TheNotesTabView(userInfo: userInfo, manager: manager).tabItem{
                Image(systemName: "tray.full.fill")
                Text("Notes")
            }
                
            TheFavouriteNotesTabView(userInfo: userInfo, manager: manager).tabItem{
                Image(systemName: "star.fill")
                Text("Favourite")
            }
                
            TheDeletedNotesTabView(userInfo: userInfo, manager: manager).tabItem{
                Image(systemName: "trash.fill")
                Text("Deleted")
            }
            
        }
    }
}

//
//struct NotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotesView(["","",""],manager: NoteManager())
//    }
//}
