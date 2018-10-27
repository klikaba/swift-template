@testable import SwiftTemplate
import RealmSwift

class CountriesApiClientMock: CountriesApiClientProtocol {
    func countries(callback: @escaping CountriesCallback) {
        let json = ["countries": [["name": "Afghanistan", "code": "AF"],
                    ["name": "Åland Islands", "code": "AX"]]]
        let countries = Countries(JSON: json)

        callback(countries, nil)
    }

    func country(identifier: String, callback: @escaping CountryCallback) {
        let json = ["name": "Afghanistan", "code": "AF"]
        callback(Country(JSON: json), nil)
    }
}
