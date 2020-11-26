//
//  CountriesAPIClient.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//
import Alamofire

typealias CountriesCallback = (_ data: Countries?, _ error: ApiError?) -> Void
typealias CountryCallback = (_ data: Country?, _ error: ApiError?) -> Void

protocol CountriesApiClientProtocol {
    func countries(callback: @escaping CountriesCallback)
    func country(identifier: String, callback: @escaping CountryCallback)
}

class CountriesApiClient: ApiClient, CountriesApiClientProtocol {
    func countries(callback: @escaping CountriesCallback) {
        makeRequest(using: .post,
                    body: nil,
                    path: "/api/v1/countries",
                    callback: callback)
    }

    func country(identifier: String, callback: @escaping CountryCallback) {
        makeRequest(using: .post,
                    body: nil,
                    path: "/api/v1/countries\(identifier)",
                    callback: callback)
    }
}
