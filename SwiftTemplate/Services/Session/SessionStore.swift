//
//  SessionStore.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/29/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper

// Change from memory store to something persistable : Local or Realm
class SessionStore {
    static let accessTokenKey: String = "ACCESS_TOKEN_JSON"

    static func save(accessToken: AccessToken) {
        UserDefaults.standard.set(accessToken.toJSONString(), forKey: accessTokenKey)
    }

    static func get() -> AccessToken? {
        if let accessTokenJSON: String = UserDefaults.standard.value(forKey: accessTokenKey) as? String {
            return Mapper<AccessToken>().map(JSONString: accessTokenJSON)
        }
        return nil
    }

    static func clear() {
        UserDefaults.standard.removeObject(forKey: accessTokenKey)
    }
}
