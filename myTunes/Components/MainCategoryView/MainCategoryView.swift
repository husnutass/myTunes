//
//  MainCategoryView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class MainCategoryView: GenericBaseView<MainCategoryViewData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var categoryStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [moviesCategoryView, musicCategoryView, appsCategoryView, booksCategoryView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.alignment = .center
        temp.distribution = .fillEqually
        temp.spacing = 15
        return temp
    }()
    
    private lazy var moviesCategoryView: MainCategoryItemView = {
        let temp = MainCategoryItemView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        return temp
    }()
    
    private lazy var musicCategoryView: MainCategoryItemView = {
        let temp = MainCategoryItemView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        return temp
    }()
    
    private lazy var appsCategoryView: MainCategoryItemView = {
        let temp = MainCategoryItemView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        return temp
    }()
    
    private lazy var booksCategoryView: MainCategoryItemView = {
        let temp = MainCategoryItemView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        moviesCategoryView.setData(by: data.movies)
        musicCategoryView.setData(by: data.music)
        appsCategoryView.setData(by: data.apps)
        booksCategoryView.setData(by: data.books)
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(categoryStackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        categoryStackView.expandView(to: containerView)
    }
    
    func resetCategoryBorderColors() {
        moviesCategoryView.resetBorderColor()
        musicCategoryView.resetBorderColor()
        appsCategoryView.resetBorderColor()
        booksCategoryView.resetBorderColor()
    }
    
}
