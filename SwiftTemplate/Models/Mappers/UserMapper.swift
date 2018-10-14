//
//  UserMapper.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
class UserMapper: ModelMapper<User, DBUser> {
    override func toDatabase(apiModel: User) -> DBUser? {
        return DBUser(id: apiModel.id,
                      name: apiModel.name,
                      nickname: apiModel.nickname,
                      email: apiModel.email,
                      goldToSend: apiModel.goldToSend,
                      goldReceived: apiModel.goldReceived)
    }
}
