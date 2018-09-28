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

    var refreshCompletionHandler: CountriesServiceCompletion?

    init(refreshCompletionHandler: CountriesServiceCompletion?) {
        self.refreshCompletionHandler = refreshCompletionHandler
    }

    func refreshCountries() {
        CountriesApiClient().countries(callback: onCountriesLoaded)
    }

    func getCountries() -> Results<DBCountry> {
        return CountryDAO().loadAll()
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
        let dbCountries = CountryMapper().toDatabaseArray(apiModels: countries.countries)
        CountryDAO().save(dbCountries)
    }
}
