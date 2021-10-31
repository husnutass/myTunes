//
//  UrlHelper.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import Foundation

enum BaseUrl: String {
    case dev = "https://itunes.apple.com/"
}

enum Path: String {
    case search = "search"
    case detail = "lookup"
}
