//
//  MainCategoryItemViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class MainCategoryItemViewData {
    
    private(set) var categoryColor: UIColor?
    private(set) var categoryImage: UIImage?
    private(set) var categoryName: String
    
    init(categoryColor: UIColor?, categoryImage: UIImage?, categoryName: String) {
        self.categoryColor = categoryColor
        self.categoryImage = categoryImage
        self.categoryName = categoryName
    }
    
}
