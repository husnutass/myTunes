//
//  MainCategoryItemView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 27.10.2021.
//

import UIKit

class MainCategoryItemView: GenericBaseView<MainCategoryItemViewData> {
    
    private lazy var categoryItemStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [shadowContainer,categoryNameLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 5
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var shadowContainer: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.layer.cornerRadius = 10
        temp.clipsToBounds = true
        temp.layer.borderWidth = 4
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    private lazy var categoryNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.font = .setFont(fontType: .bold, size: 18)
        temp.textColor = .white
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        imageView.image = data.categoryImage
        containerView.layer.borderColor = data.categoryColor?.cgColor
        categoryNameLabel.text = data.categoryName
        //        containerView.layer.borderWidth = 0
    }
    
    private func addComponents() {
        addSubview(categoryItemStackView)
        shadowContainer.addSubview(containerView)
        containerView.addSubview(imageView)
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth/4)-25
        
        NSLayoutConstraint.activate([
            shadowContainer.heightAnchor.constraint(equalToConstant: itemWidth),
            shadowContainer.widthAnchor.constraint(equalToConstant: itemWidth)
        ])
        
        categoryItemStackView.expandView(to: self)
        containerView.expandView(to: shadowContainer)
        imageView.expandView(to: containerView)
    }
    
}
