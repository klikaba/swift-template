//
//  Countries.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Countries: Mappable {
    var countries: [Country]

    init?(map: Map) {
        countries = []
    }

    mutating func mapping(map: Map) {
        countries <- map["countries"]
    }
}
