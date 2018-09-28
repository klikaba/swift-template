//
//  HomeViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

class HomeViewModel: AppViewModel {

    func refreshCountries() {
        CountriesRepository(refreshCompletionHandler: refreshCompletionHandler).refreshCountries()
    }


    func refreshCompletionHandler(_ error: ApiError?) {

    }

}
