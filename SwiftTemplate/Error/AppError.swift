//
//  AppError.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Alamofire

class AppError: Error {
}

class ApiError: AppError {

    /// The URL request sent to the server.
    public let request: URLRequest?

    /// The server's response to the URL request.
    public let response: HTTPURLResponse?

    /// The data returned by the server.
    public let data: Data?

    /// Returns the associated error
    public var error: Error?

    public init(
        request: URLRequest?,
        response: HTTPURLResponse?,
        data: Data?,
        error: Error?) {
        self.request = request
        self.response = response
        self.data = data
        self.error = error
    }

    static func fromDataResponse<T>(response: DataResponse<T>) -> ApiError? {
        if response.result.isFailure {
            return ApiError(request: response.request,
                            response: response.response,
                            data: response.data,
                            error: response.error)
        }
        return nil
    }

}
