//
//  AddNew.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct AddNew: View {
    let manager : NoteManager
    
    var pickerType = ["Note", "To Do", "Reminder"]
    
    @Environment(\.presentationMode) var presentationMode
    

    @State var noteTitle:   String = ""
    @State var text:        String = ""
    @State var isFavourite: Bool   = false
    @State var type:        String = "Note"
    @State var createdAt:   Date   = Date()
    @State var dueDate:     String = ""
    
    @State var time:String         = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let dateTimeString = formatter.string(from: Date())
        return dateTimeString
    }()
    
    var body: some View{
        VStack{
            Form{
                HStack {
                    Text("Note's Title: ")
                    TextField("Note's Title", text:$noteTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(3)
                
                HStack{
                    Text("Text: ")
                    TextView(text: $text).frame(numLines: 4)
                    
                }.padding(3)
                
                HStack{
                    Text("Favorite")
                    Spacer()
                    Toggle(isOn: $isFavourite) { Text("Favorite") }
                }.padding(3)
                
                HStack{
                    Picker("Type: ", selection: $type) {
                        ForEach(0 ..< pickerType.count){
                            Text(self.pickerType[$0])
                        }
                    }
                }.padding(3)
                
                HStack{
                    Text("Creation Time: ")
                    Spacer()
                    Text("\(time)")
                }.padding(3)
                
            }
            
            Section{
                Button(action: {
                    let addedNote : Notes = Notes(title: self.noteTitle, text: self.text, type: self.type, createdAt: self.createdAt, isFavourite: self.isFavourite)
                    print("ADDED NOTE")
                    print(addedNote)
                    self.manager.notes.append(addedNote)
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Add ...")
                }
                    .padding(12)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        
    }
}


struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew(manager: NoteManager())
    }
}
