//
//  DetailDescriptionLabelViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation

class DetailDescriptionLabelViewData {
    
    private(set) var titleText: String
    private(set) var descriptionText: String
    
    init(titleText: String, descriptionText: String) {
        self.titleText = titleText
        self.descriptionText = descriptionText
    }
    
}
