//
//  SearchDataResponse.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import Foundation

// MARK: - SearchDataResponse
struct SearchDataResponse: Codable {
    var resultCount: Int
    var results: [SearchDataResult]
}

// MARK: - SearchDataResult
struct SearchDataResult: Codable {
    let collectionName, trackName, formattedPrice, releaseDate, currentVersionReleaseDate, artistName, description, shortDescription, longDescription: String?
    let artworkUrl100: String
    let collectionPrice, price: Double?
    let trackId: Int
}

