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
    var userDAO: UserDAO
    var userAPIClient: UserApiClient
    var userMapper: UserMapper

    var userActionCompletionHandler: UserActionCompletion?

    init(userDAO: UserDAO, userAPIClient: UserApiClient, userMapper: UserMapper) {
        self.userDAO = userDAO
        self.userAPIClient = userAPIClient
        self.userMapper = userMapper
    }

    func create(username: String, password: String) {
        userAPIClient.create(username: username, password: password, callback: onUserLoaded)
    }

    func refreshUser(identifier: String) {
        userAPIClient.getUser(identifier: identifier, callback: onUserLoaded)
    }

    func getUser(identifier: String) -> DBUser? {
        return userDAO.load(forPrimaryKey: identifier)
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
        let dbUser = userMapper.toDatabase(apiModel: user)
        userDAO.save(dbUser)
    }
}
