//
//  UserDAO.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

class UserDAO: RealmDAO<DBUser> {
    func save(_ user: DBUser?) {
        if let user = user {
            self.update(object: user)
        }
    }
}
