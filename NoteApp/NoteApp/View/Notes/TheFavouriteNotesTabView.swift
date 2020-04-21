//
//  TheFavouriteTabView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct TheFavouriteNotesTabView: View{
    let userInfo : [String]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var manager: NoteManager
    
    @State private var showingAddScreen  = false
    @State private var showingNoteDetail = false
    @State private var showingUserProf   = false
    
    var body: some View{
        VStack{
            HStack{
                Text("The Favourite Notes")
                    .font(.system(size:35))
                    .bold()
                
                Spacer()
                
                Button(action:{
                    self.showingAddScreen.toggle()
                }){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                }
                    .padding(2)
                    .sheet(isPresented: $showingAddScreen){
                        AddNew(manager: self.manager)
                    }
                
                Button(action:{
                    self.showingUserProf.toggle()
                }){
                  Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 35.0, height: 35.0)
                }
                    .sheet(isPresented: $showingUserProf){
                        UserProfileView(userInfo: self.userInfo,manager: self.manager)
                    }
                
            }.padding(5)
            List{
                ForEach(self.manager.notes){ note in
                    if note.isFavourite {
                        Button(action: {
                            self.showingNoteDetail.toggle()
                        }){
                            NoteRow(notes: note)
                        }.sheet(isPresented: self.$showingNoteDetail) {NoteDetail(note: note)}
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct TheFavouriteNotesTabView_Previews: PreviewProvider {
    static var previews: some View {
        TheFavouriteNotesTabView(userInfo: ["","",""], manager: NoteManager())
    }
}
