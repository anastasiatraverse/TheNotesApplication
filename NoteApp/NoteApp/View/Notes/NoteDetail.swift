//
//  NoteDetail.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct NoteDetail: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let note: Notes

    var body: some View {
        VStack{
            HStack{
                Text(self.note.title)
                    .bold()
                    .font(.system(size:42))
                    .padding(10)
                if note.isFavourite{
                    Image(systemName: "star.fill")
                }else{
                    Image(systemName: "star")
                }
            }
            Text(note.text)
            
            
        }
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note:  NoteManager().notes[0])
    }
}
