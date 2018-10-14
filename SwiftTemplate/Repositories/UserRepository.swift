//
//  RegistrationRepository.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
typealias UserActionCompletion = (_ error: ApiError?) -> Void

class UserRepository {
    var database: UserDAO
    var network: UserApiClient
    var mapper: UserMapper

    var userActionCompletionHandler: UserActionCompletion?

    init(database: UserDAO, network: UserApiClient, mapper: UserMapper) {
        self.database = database
        self.network = network
        self.mapper = mapper
    }

    func create(username: String, password: String) {
        network.create(username: username, password: password, callback: onUserLoaded)
    }

    func refreshUser(identifier: String) {
        network.getUser(identifier: identifier, callback: onUserLoaded)
    }

    func getUser(identifier: String) -> DBUser? {
        return database.load(forPrimaryKey: identifier)
    }

    func onUserLoaded(_ user: User?, _ error: ApiError?) {
        if let error = error {
            userActionCompletionHandler?(error)
            return
        }

        if let user = user {
            saveToDb(user: user)
            userActionCompletionHandler?(nil)
        }
    }

    fileprivate func saveToDb(user: User) {
        let dbUser = mapper.toDatabase(apiModel: user)
        database.save(dbUser)
    }
}
