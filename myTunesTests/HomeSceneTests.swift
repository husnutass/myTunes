//
//  HomeSceneTests.swift
//  myTunesTests
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import XCTest
@testable import myTunes

class HomeSceneTests: XCTestCase {
    
    private var moviesData: SearchDataResponse?
    private var searchService: MockSearchService!
    
    override func setUp() {
        searchService = MockSearchService()
    }
    
    func test_searchData() {
        let movies = try? ResourceLoader.loadMovies()
        
        searchService.getSearchData { result in
            switch result {
            case .success(let response):
                self.moviesData = response
                XCTAssertEqual(movies?.resultCount, self.moviesData?.resultCount)
                XCTAssertEqual(movies?.results[0].trackName, self.moviesData?.results[0].trackName)
            case .failure(_):
                self.moviesData = nil
            }
        }
    }
    
    func test_emptySearchData() {
        searchService.getEmptySearchData { result in
            switch result {
            case .success(let response):
                self.moviesData = response
                XCTAssertEqual(0, self.moviesData?.resultCount)
                XCTAssertEqual(nil, self.moviesData?.results[0].trackName)
            case .failure(_):
                self.moviesData = nil
            }
        }
    }
    
}
