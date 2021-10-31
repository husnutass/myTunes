//
//  ResourceLoader.swift
//  myTunesTests
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation
@testable import myTunes

class ResourceLoader {
    
    static func loadMovies() throws -> SearchDataResponse {
        let bundle = Bundle.test
        let url = bundle.url(forResource: "moviesData", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let categories = try decoder.decode(SearchDataResponse.self, from: data)
        return categories
    }

}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
