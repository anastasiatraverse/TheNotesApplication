//
//  Note.swift
//  NoteApp
//
//  Created by Анастасия Траверсе on 25.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import Foundation
import SwiftUI

struct Notes: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let type: String
    let createdAt: Date?
    let isFavourite: Bool
    var isDeleted: Bool = false
}

