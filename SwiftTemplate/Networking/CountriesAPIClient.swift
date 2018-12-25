//
//  CountriesAPIClient.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

class CountriesApiClient: ApiClient {
    func countries(callback: @escaping (_ data: Countries?, _ error: ApiError?) -> Void) {
        callApi(using: .get, with: nil, for: "/api/v1/countries", callback: callback)
    }

    func country(identifier: String, callback: @escaping (_ data: Country?, _ error: ApiError?) -> Void) {
        callApi(using: .get, with: nil, for: "/api/v1/countries\(identifier)", callback: callback)
    }
}
