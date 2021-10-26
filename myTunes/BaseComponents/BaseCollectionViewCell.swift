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
        setupViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewConfigurations()
    }
    
    func setupViewConfigurations() {}
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
