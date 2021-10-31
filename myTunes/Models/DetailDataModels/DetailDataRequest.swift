//
//  DetailDataRequest.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation

class DetailDataRequest: Codable {
    
    private(set) public var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    
}
