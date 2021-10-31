//
//  EmptyHomeViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class EmptyHomeViewData {
    
    private(set) var category: Category
    private(set) var categoryColor: UIColor?
    
    init(category: Category, categoryColor: UIColor?) {
        self.category = category
        self.categoryColor = categoryColor
    }
    
}
