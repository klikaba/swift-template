import XCTest
@testable import SwiftTemplate
import RealmSwift

class CountriesViewModelTest: XCTestCase {
    var countriesViewModel: CountriesViewModel!
    var countriesRepository: CountriesRepository!
    var countriesApiClientMock: CountriesApiClientMock!

    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        countriesApiClientMock = CountriesApiClientMock()
        countriesRepository = CountriesRepository(countryDAO: CountryDAO(),
                                                  countriesAPIClient: countriesApiClientMock,
                                                  countryMapper: CountryMapper())
        countriesViewModel = CountriesViewModel(countriesRepository: countriesRepository)
    }

    override func tearDown() {
        countriesViewModel = nil
        countriesRepository = nil
        countriesApiClientMock = nil
    }

    func testRefreshCountries() {
        countriesViewModel.refreshCountries()
        XCTAssertEqual(countriesViewModel.numberOfRows, 2)

        let firstCountryName = countriesViewModel.countries?.first?.name
        XCTAssertEqual(firstCountryName, "Afghanistan")
    }
}
