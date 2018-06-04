//
//  DBCountryDAO.swift
//  ios-skeletron
//
//  Created by Ognjen on 1/23/18.
//  Copyright © 2018 Klika doo. All rights reserved.
//

import Foundation

class CountryDAO: RealmDAO<DBCountry> {
    func save(_ country: DBCountry?) {
        if let country = country {
            self.update(object: country)
        }
    }

    func save(_ countries: [DBCountry]) {
        self.cleanSave(data: countries)
    }
}
