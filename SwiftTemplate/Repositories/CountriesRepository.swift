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

protocol CountriesRepositoryProtocol {
    func refreshCountries()
    func getCountries() -> Results<DBCountry>
}

class CountriesRepository: CountriesRepositoryProtocol {
    private let countryDAO: CountryDAO
    private let countriesAPIClient: CountriesApiClientProtocol
    private let countryMapper: CountryMapper

    var refreshCompletionHandler: CountriesServiceCompletion?

    init(
        countryDAO: CountryDAO,
        countriesAPIClient: CountriesApiClientProtocol,
        countryMapper: CountryMapper
    ) {
        self.countryDAO = countryDAO
        self.countriesAPIClient = countriesAPIClient
        self.countryMapper = countryMapper
    }

    func refreshCountries() {
        countriesAPIClient.countries(callback: onCountriesLoaded)
    }

    func getCountries() -> Results<DBCountry> {
        return countryDAO.loadAll()
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

    private func saveToDb(countries: Countries) {
        let dbCountries = countryMapper.toDatabaseArray(apiModels: countries.countries)
        countryDAO.save(dbCountries)
    }
}
