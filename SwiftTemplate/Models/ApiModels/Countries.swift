//
//  Countries.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ObjectMapper

class Countries: Mappable {
    var countries: [Country]

    required public init?(map: Map) {
        countries = []
    }

    func mapping(map: Map) {
        countries <- map["countries"]
    }
}
