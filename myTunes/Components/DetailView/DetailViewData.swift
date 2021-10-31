//
//  DetailViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation

class DetailViewData {
    
    private(set) var topViewData: DetailTopViewData
    private(set) var descriptionViewData: DetailDescriptionLabelViewData
    
    init(topViewData: DetailTopViewData, descriptionViewData: DetailDescriptionLabelViewData) {
        self.topViewData = topViewData
        self.descriptionViewData = descriptionViewData
    }
    
}
