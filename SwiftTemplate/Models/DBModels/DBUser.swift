//
//  DBUser.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class DBUser: Object {
    @objc dynamic
    // swiftlint:disable:next identifier_name
    var id: String = ""
    @objc dynamic
    var name: String = ""
    @objc dynamic
    var nickname: String = ""
    @objc dynamic
    var email: String = ""
    @objc dynamic
    var goldToSend: Int = 0
    @objc dynamic
    var goldReceived: Int = 0

    override class func primaryKey() -> String? {
        return "id"
    }

    required init() {
        super.init()
    }
    // swiftlint:disable:next identifier_name
    init(id: String, name: String, nickname: String, email: String, goldToSend: Int, goldReceived: Int) {
        super.init()
        self.id = id
        self.name = name
        self.nickname = nickname
        self.email = email
        self.goldToSend = goldToSend
        self.goldReceived = goldReceived
    }

    // MARK: - for mapping from API model
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
