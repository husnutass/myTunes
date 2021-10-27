//
//  HomeView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class HomeView: GenericBaseView<HomeViewData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [searchFieldView, mainCategoryView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.distribution = .fill
        temp.spacing = 20
        return temp
    }()
    
    private lazy var searchFieldView: SearchFieldView = {
        let temp = SearchFieldView(data: SearchFieldData(placeHolder: "Search", leftIcon: SFSymbols.magnifyingglass.value))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return temp
    }()
    
    private lazy var mainCategoryView: MainCategoryView = {
        let temp = MainCategoryView(data: MainCategoryViewData(movies: MainCategoryItemViewData(categoryColor: .movies, categoryImage: .movies, categoryName: "Movies"), music: MainCategoryItemViewData(categoryColor: .music, categoryImage: .music, categoryName: "Music"), apps: MainCategoryItemViewData(categoryColor: .apps, categoryImage: .apps, categoryName: "Apps"), books: MainCategoryItemViewData(categoryColor: .books, categoryImage: .books, categoryName: "Books")))
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
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
//        containerView.expandView(to: self, top: safeAreaInsets.top, bottom: -safeAreaInsets.bottom, leading: 25, trailing: -25)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        mainStackView.expandView(to: containerView)
        
        
    }
    
}
