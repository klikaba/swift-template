//
//  CountryMapper.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/31/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

class CountryMapper: ModelMapper<Country, DBCountry> {
    override func toDatabase(apiModel: Country) -> DBCountry? {
        return DBCountry(name: apiModel.name, code: apiModel.id)
    }
}
