//
//  DetailTopViewData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailTopViewData {
    
    private(set) var imageUrl: String
    private(set) var name: String
    private(set) var price: String
    private(set) var releaseDate: String
    private(set) var artistName: String
    private(set) var categoryColor: UIColor?
    
    init(imageUrl: String, name: String, price: String, releaseDate: String, artistName: String, categoryColor: UIColor?) {
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.releaseDate = releaseDate
        self.artistName = artistName
        self.categoryColor = categoryColor
    }
    
}
