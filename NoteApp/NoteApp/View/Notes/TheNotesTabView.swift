//
//  TheNotesTabView.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct TheNotesTabView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var manager: NoteManager
    
    @State private var showingAddScreen = false
    @State private var showingDetail    = false
    @State private var showingUserProf  = false
    
    var body: some View{
        VStack{
            HStack{
                Text("The Notes")
                    .bold()
                    .font(.system(size:35))
                
                Spacer()
                
                Button(action: {
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
                        UserProfileView()
                    }
                
            }.padding(5)
            
            List{
                
                ForEach(self.manager.notes){ note in
                    if !note.isDeleted{
                        Button(action: {
                            self.showingDetail.toggle()
                        }){
                            NoteRow(notes: note)
                        }.sheet(isPresented: self.$showingDetail) {NoteDetail(note: note)}
                    }
                }.onDelete(perform: delete)
                
            }
        }
        
        .navigationBarTitle("Notes List")
        .navigationBarHidden(true)
        
    }
    
    func delete(at offsets: IndexSet) {
        offsets.forEach{
            manager.notes[$0].isDeleted = true
        }
    }
    
}


struct TheNotesTabView_Previews: PreviewProvider {
    static var previews: some View {
        TheNotesTabView(manager: NoteManager())
    }
}
