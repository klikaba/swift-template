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

    func signIn(username: String, password: String,
                callback: @escaping (_ accessToken: AccessToken?, _ error: ApiError?) -> Void) {
        let parameters: Parameters = ["grant_type": "password",
                                      "username": username,
                                      "password": password,
                                      "client_id": AppConfiguration.sharedInstance().apiClient,
                                      "client_secret": AppConfiguration.sharedInstance().apiSecret]
        Alamofire.request(buildUrl("/oauth/token"), method: .post, parameters: parameters).validate()
            .responseObject { (response: DataResponse<AccessToken>) in
                callback(response.value, ApiError.fromDataResponse(response: response))
            }
    }

    func countries(callback: @escaping (_ countries: Countries?, _ error: ApiError?) -> Void) {
        ApiClient.sessionManager.request(buildUrl("/api/v1/countries")).validate()
            .responseObject { (response: DataResponse<Countries>) in
                callback(response.value, ApiError.fromDataResponse(response: response))
            }
    }
}
