//
//  SearchFieldData.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import Foundation

typealias SearchFieldChangeBlock = (String?) -> Void

class SearchFieldData {
    
    private(set) var placeHolder: String
    private(set) var searchFieldChangeListener: SearchFieldChangeBlock?
    
    init(placeHolder: String) {
        self.placeHolder = placeHolder
    }
    
    func setSearchFieldChangeListener(by value: @escaping SearchFieldChangeBlock) -> Self {
        searchFieldChangeListener = value
        return self
    }
    
}
