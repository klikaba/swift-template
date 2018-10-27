//
//  SessionStore.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/29/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper
protocol SessionStoreProtocol {
    func save(accessToken: AccessToken)
    func get() -> AccessToken?
    func clear()
}

// Change from memory store to something persistable : Local or Realm
class SessionStore: SessionStoreProtocol {
    let accessTokenKey: String = "ACCESS_TOKEN_JSON"
    static let currentSession = SessionStore()

    func save(accessToken: AccessToken) {
        UserDefaults.standard.set(accessToken.toJSONString(), forKey: accessTokenKey)
    }

    func get() -> AccessToken? {
        if let accessTokenJSON: String = UserDefaults.standard.value(forKey: accessTokenKey) as? String {
            return Mapper<AccessToken>().map(JSONString: accessTokenJSON)
        }
        return nil
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: accessTokenKey)
    }
}
