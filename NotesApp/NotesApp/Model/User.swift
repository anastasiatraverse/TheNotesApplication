//
//  File.swift
//  NotesApp
//
//  Created by Анастасия Траверсе on 18.03.2020.
//  Copyright © 2020 Анастасия Траверсе. All rights reserved.
//

import Foundation
import CoreData

public class User:NSManagedObject, Identifiable{
    @NSManaged public var login: String?
    @NSManaged public var password: String?
}

extension User{
     
}
