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
    var countriesRepo: CountriesRepository!
    var numberOfRows: Int {
        return countries?.count ?? 0
    }

    var onRefreshCompleted: ((_ error: ApiError?) -> Void)?

    init(countriesRepo: CountriesRepository) {
        self.countriesRepo = countriesRepo
        super.init()
        countriesRepo.refreshCompletionHandler = refreshCompletionHandler
    }

    func refreshCountries() {
        countriesRepo.refreshCountries()
    }

    func refreshCompletionHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            countries = Array(countriesRepo.getCountries())
        }
        onRefreshCompleted?(error)
    }

}
