//
//  Country.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper

class Country: Mappable {

    required public init?(map: Map) {
    }

    // swiftlint:disable:next identifier_name
    var id: String = ""
    var name: String = ""

    func mapping(map: Map) {
        id <- map["code"]
        name <- map["name"]
    }
}
