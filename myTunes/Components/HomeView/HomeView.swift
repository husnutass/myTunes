//
//  HomeView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class HomeView: GenericBaseView<HomeViewData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [searchFieldView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.distribution = .fill
        return temp
    }()
    
    private lazy var searchFieldView: SearchFieldView = {
        let temp = SearchFieldView(data: SearchFieldData(placeHolder: "Search", leftIcon: SFSymbols.magnifyingglass.value))
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
    }
    
    private func addComponents() {
        addSubview(mainStackView)
        
        mainStackView.expandView(to: self)
    }
    
}
