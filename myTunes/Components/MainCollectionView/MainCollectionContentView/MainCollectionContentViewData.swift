//
//  MainCollectionContentViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import UIKit

class MainCollectionContentViewData {
        
    private(set) var imageUrl: String
    private(set) var name: String
    private(set) var price: String
    private(set) var releaseDate: String
    
    init(imageUrl: String, name: String, price: String, releaseDate: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.releaseDate = releaseDate
    }
    
}
