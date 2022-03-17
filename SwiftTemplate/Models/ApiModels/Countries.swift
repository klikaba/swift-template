import Foundation

struct Countries: Codable {
    var countries: [Country]

    init(_ countries: [Country]) {
        self.countries = countries
    }

    init?(JSON: [String: Any]) {
        guard let countries = JSON["countries"] as? [Any] else { return nil }
        var extractedCountries = [Country]()
        for country in countries {
            guard let countryJSON = country as? [String: Any] else { return nil }
            guard let extractedCountry = Country(JSON: countryJSON) else { return nil }
            extractedCountries.append(extractedCountry)
        }
        self.countries = extractedCountries
    }
}
