//
//  SearchFieldData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

typealias SearchFieldChangeBlock = (String?) -> Void

class SearchFieldData {
    
    private(set) var placeHolder: String
    private(set) var leftIcon: UIImage?
    private(set) var searchFieldChangeListener: SearchFieldChangeBlock?
    
    init(placeHolder: String, leftIcon: UIImage?) {
        self.placeHolder = placeHolder
        self.leftIcon = leftIcon
    }
    
    func setSearchFieldChangeListener(by value: @escaping SearchFieldChangeBlock) -> Self {
        searchFieldChangeListener = value
        return self
    }
    
}
