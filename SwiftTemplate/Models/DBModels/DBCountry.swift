//
//  DBCountry.swift
//  SwiftTemplate
//
//  Created by Ognjen on 1/23/18.
//  Copyright © 2018 Klika doo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class DBCountry: Object {

    @objc dynamic
    // swiftlint:disable:next identifier_name
    var id: String = ""

    @objc dynamic
    var name: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }

    required init() {
        super.init()
    }

    init(name: String, code: String) {
        super.init()
        self.id = code
        self.name = name
    }

    // MARK: - for mapping from API model
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
