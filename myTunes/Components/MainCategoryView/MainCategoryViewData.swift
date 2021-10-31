//
//  MainCategoryViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import Foundation

typealias CategoryChangeBlock = (MediaType) -> Void

class MainCategoryViewData {
    
    private(set) var movies: MainCategoryItemViewData
    private(set) var music: MainCategoryItemViewData
    private(set) var apps: MainCategoryItemViewData
    private(set) var books: MainCategoryItemViewData
    private(set) var categoryChangeListener: CategoryChangeBlock?
    
    init(movies: MainCategoryItemViewData, music: MainCategoryItemViewData, apps: MainCategoryItemViewData, books: MainCategoryItemViewData) {
        self.movies = movies
        self.music = music
        self.apps = apps
        self.books = books
    }
    
    func setCategoryChangeListener(by value: @escaping CategoryChangeBlock) -> Self {
        categoryChangeListener = value
        return self
    }
    
}
