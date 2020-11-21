//
//  SessionStore.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/29/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

protocol SessionStoreProtocol {
    func save(accessToken: AccessToken)
    func get() -> AccessToken?
    func clear()
}

// Change from memory store to something persistable : Local or Realm
class SessionStore: SessionStoreProtocol {
    private let accessTokenKey: String = "ACCESS_TOKEN_JSON"
    static let currentSession = SessionStore()

    func save(accessToken: AccessToken) {
        guard let encodedToken = try? accessToken.encoded() else { return }
        KeyChainHelper.save(key: accessTokenKey, data: encodedToken)
    }

    func get() -> AccessToken? {
        guard let accessToken = KeyChainHelper.load(key: accessTokenKey) else {
            return nil
        }
        return try? accessToken.decoded()
    }

    func clear() {
        KeyChainHelper.removeData(forKey: accessTokenKey)
    }
}
