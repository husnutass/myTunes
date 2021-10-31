//
//  BaseCollectionViewCell.swift
//  myTunes
//
//  Created by Hüsnü Taş on 26.10.2021.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorViewComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViewComponents()
    }
    
    func addMajorViewComponents() {}
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
