//
//  NoteManager.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import SwiftUI

class NoteManager: ObservableObject {
    @Published var notes: [Notes] = [
        Notes(title: "Hello!", text: "Welcome to 'TheNotesApp'", type: "Note",createdAt: Date(), isFavourite: true)
    ]
}
