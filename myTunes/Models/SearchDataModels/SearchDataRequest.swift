//
//  MoviesDataRequest.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import Foundation

class SearchDataRequest: Codable {
    
    private(set) public var term: String = ""
    private(set) public var media: String = MediaType.movies.rawValue
    private(set) public var limit: Int = 20
    private(set) public var offset: Int = 0
    
    var fetching = false
    
    func setTerm(term: String) {
        self.term = term
    }
    
    func setMedia(media: String) {
        self.media = media
    }
    
    func setOffset(offset: Int) {
        self.offset = offset
    }
    
    func incrementOffset() {
        fetching = true
        offset += limit
    }
    
    func checkLoadingMore(control resultCount: Int) -> Bool {
        return limit <= resultCount && !fetching
    }
    
}

enum MediaType: String {
    case movies = "movie"
    case music = "music"
    case apps = "software"
    case books = "ebook"
}
