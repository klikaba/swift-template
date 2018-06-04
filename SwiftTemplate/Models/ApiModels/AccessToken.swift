//
//  AccessToken.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import ObjectMapper

class AccessToken: Mappable {
    required public init?(map: Map) {}

    var accessToken: String = ""
    var refreshToken: String = ""
    var tokenType: String = ""
    var expiresIn: Int = 60
    var createdAt: Int = -1
    var userId: Int = -1

    func mapping(map: Map) {
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        createdAt <- map["created_at"]
        userId <- map["user_id"]
    }

}
