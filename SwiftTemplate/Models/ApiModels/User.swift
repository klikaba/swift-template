//
//  User.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
     // swiftlint:disable:next identifier_name
    var id: String = ""
    var name: String = ""
    var nickname: String = ""
    var email: String = ""
    var goldToSend: Int = 0
    var goldReceived: Int = 0

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        nickname <- map["nickname"]
        email <- map["email"]
        goldToSend <- map["gold_to_send"]
        goldReceived <- map["gold_received"]
    }

}
