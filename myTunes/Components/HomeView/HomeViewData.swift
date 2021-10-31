//
//  HomeViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import Foundation

class HomeViewData {
    
    private(set) var searchFieldData: SearchFieldData?
    private(set) var mainCategoryViewData: MainCategoryViewData?
    
    init(searchFieldData: SearchFieldData, mainCategoryViewData: MainCategoryViewData) {
        self.searchFieldData = searchFieldData
        self.mainCategoryViewData = mainCategoryViewData
    }
    
}
