//
//  NoteRow.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

struct NoteRow: View {
    let notes: Notes
    
    var body: some View {
        HStack{
            Text(self.notes.title)
            Spacer()
            Text(self.notes.text)
            Spacer()
            if notes.isFavourite{
                Image(systemName: "star.fill")
            }else{
                Image(systemName: "star")
            }
            Image(systemName: "chevron.right.circle")
        }
    }
}
