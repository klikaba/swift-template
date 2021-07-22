//
//  RegistrationRepository.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

typealias UserCallback = (_ error: ApiError?) -> Void

protocol UserRepositoryProtocol {
    func create(username: String, password: String, callback: @escaping UserCallback)
    func refreshUser(identifier: String, callback: @escaping UserCallback)
    func getUser(identifier: String) -> DBUser?
}

class UserRepository {
    private let userDAO: UserDAO
    private let userAPIClient: UserApiClient
    private let userMapper: UserMapper

    init(userDAO: UserDAO, userAPIClient: UserApiClient, userMapper: UserMapper) {
        self.userDAO = userDAO
        self.userAPIClient = userAPIClient
        self.userMapper = userMapper
    }

    func create(username: String, password: String, callback: @escaping UserCallback) {
        userAPIClient.create(username: username, password: password) { [weak self ] user, error in
            if let user = user {
                self?.saveToDb(user: user)
            }
            callback(error)
        }
    }

    func refreshUser(identifier: String, callback: @escaping UserCallback) {
        userAPIClient.getUser(identifier: identifier) { [weak self ] user, error in
            if let user = user {
                self?.saveToDb(user: user)
            }
            callback(error)
        }
    }

    func getUser(identifier: String) -> DBUser? {
        return userDAO.load(forPrimaryKey: identifier)
    }

    private func saveToDb(user: User) {
        let dbUser = userMapper.toDatabase(apiModel: user)
        userDAO.save(dbUser)
    }
}
