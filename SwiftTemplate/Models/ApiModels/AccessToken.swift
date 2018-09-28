//
//  AccessToken.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import ObjectMapper

class BaseResponse: Mappable {
    var error: String = ""
    var errorDescription: String = ""

    required public init?(map: Map) {}

    func mapping(map: Map) {
        error <- map["error"]
        errorDescription <- map["error_description"]
    }
}

class AccessToken: BaseResponse {
    var accessToken: String = ""
    var refreshToken: String = ""
    var tokenType: String = ""
    var expiresIn: Int = 60
    var createdAt: Int = -1
    var userId: Int = -1

    required public init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        createdAt <- map["created_at"]
        userId <- map["user_id"]
    }

}
