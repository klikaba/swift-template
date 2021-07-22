//
//  HomeViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import RealmSwift

class CountriesViewModel: AppViewModel {
    var countries: [DBCountry]?
    var countriesRepository: CountriesRepositoryProtocol!
    var numberOfRows: Int {
        return countries?.count ?? 0
    }

    var onRefreshCompleted: ((_ error: ApiError?) -> Void)?

    init(countriesRepository: CountriesRepository) {
        self.countriesRepository = countriesRepository
        super.init()
        countriesRepository.refreshCompletionHandler = { [weak self] error in
            self?.refreshCompletionHandler(error)
        }
    }

    func refreshCountries() {
        countriesRepository.refreshCountries()
    }

    func refreshCompletionHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            countries = Array(countriesRepository.getCountries())
        }
        onRefreshCompleted?(error)
    }

}
