//
//  MainCollectionCellView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 29.10.2021.
//

import Foundation

class MainCollectionViewCell: BaseCollectionViewCell {
    
    private lazy var mainContentView: MainCollectionContentView = {
        let temp = MainCollectionContentView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addContentView()
    }
    
    func setData(with cellData: MainCollectionContentViewData) {
        mainContentView.setData(by: cellData)
    }
    
    private func addContentView() {
        contentView.addSubview(mainContentView)
        
        mainContentView.expandView(to: contentView)
    }
    
}
