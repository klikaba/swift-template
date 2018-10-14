//
//  CountriesService.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import RealmSwift

typealias CountriesServiceCompletion = (_ error: ApiError?) -> Void

class CountriesRepository {
    var database: CountryDAO
    var network: CountriesApiClient
    var mapper: CountryMapper

    var refreshCompletionHandler: CountriesServiceCompletion?

    init(database: CountryDAO, network: CountriesApiClient, mapper: CountryMapper) {
        self.database = database
        self.network = network
        self.mapper = mapper
    }

    func refreshCountries() {
        network.countries(callback: onCountriesLoaded)
    }

    func getCountries() -> Results<DBCountry> {
        return database.loadAll()
    }

    fileprivate func onCountriesLoaded(_ countries: Countries?, _ error: ApiError?) {
        if let error = error {
            refreshCompletionHandler?(error)
            return
        }

        if let countries = countries {
            saveToDb(countries: countries)
            refreshCompletionHandler?(nil)
        }
    }

    fileprivate func saveToDb(countries: Countries) {
        let dbCountries = mapper.toDatabaseArray(apiModels: countries.countries)
        database.save(dbCountries)
    }
}
