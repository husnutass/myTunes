//
//  MainCollectionContentViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import UIKit

class MainCollectionContentViewData {
        
    private(set) var image: UIImage?
    private(set) var name: String
    private(set) var price: String
    private(set) var releaseDate: String
    
    init(image: UIImage?, name: String, price: String, releaseDate: String) {
        self.image = image
        self.name = name
        self.price = price
        self.releaseDate = releaseDate
    }
    
}
