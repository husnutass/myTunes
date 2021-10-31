//
//  SFSymbols.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

enum SFSymbols: String, GenericValueProtocol {

    typealias Value = UIImage?
    
    var value: UIImage? {
        return UIImage(systemName: rawValue)
    }
    
    case magnifyingglass = "magnifyingglass"
    
}
