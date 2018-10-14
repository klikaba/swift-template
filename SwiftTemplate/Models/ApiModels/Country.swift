//
//  Country.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Country: Mappable {

    init?(map: Map) {
    }

    // swiftlint:disable:next identifier_name
    var id: String = ""
    var name: String = ""

    mutating func mapping(map: Map) {
        id <- map["code"]
        name <- map["name"]
    }
}
