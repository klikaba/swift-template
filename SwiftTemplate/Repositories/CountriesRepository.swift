//
//  CountriesService.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import RealmSwift

typealias CountriesCompletionCallback = (_ error: ApiError?) -> Void

protocol CountriesRepositoryProtocol {
    func refreshCountries(callback: @escaping CountriesCompletionCallback)
    func getCountries() -> Results<DBCountry>
}

class CountriesRepository: CountriesRepositoryProtocol {
    private let countryDAO: CountryDAO
    private let countriesAPIClient: CountriesApiClientProtocol
    private let countryMapper: CountryMapper

    init(
        countryDAO: CountryDAO,
        countriesAPIClient: CountriesApiClientProtocol,
        countryMapper: CountryMapper
    ) {
        self.countryDAO = countryDAO
        self.countriesAPIClient = countriesAPIClient
        self.countryMapper = countryMapper
    }

    func refreshCountries(callback: @escaping CountriesCompletionCallback) {
        countriesAPIClient.countries { [weak self] countries, error in
            if let countries = countries {
                self?.saveToDb(countries: countries)
            }
            callback(error)
        }
    }

    func getCountries() -> Results<DBCountry> {
        return countryDAO.loadAll()
    }

    private func saveToDb(countries: Countries) {
        let dbCountries = countryMapper.toDatabaseArray(apiModels: countries.countries)
        countryDAO.save(dbCountries)
    }
}
