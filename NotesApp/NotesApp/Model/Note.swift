//
//  Note.swift
//  NotesApp
//
//  Created by Анастасия Траверсе on 18.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import Foundation

class Note: Identifiable{
    let id = UUID()
    let title = String()
    let body = String()
    let isFavourite = String()
}

