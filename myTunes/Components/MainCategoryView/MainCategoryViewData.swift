//
//  MainCategoryViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import Foundation

class MainCategoryViewData {
    
    private(set) var movies: MainCategoryItemViewData
    private(set) var music: MainCategoryItemViewData
    private(set) var apps: MainCategoryItemViewData
    private(set) var books: MainCategoryItemViewData
    
    init(movies: MainCategoryItemViewData, music: MainCategoryItemViewData, apps: MainCategoryItemViewData, books: MainCategoryItemViewData) {
        self.movies = movies
        self.music = music
        self.apps = apps
        self.books = books
    }
    
}
