//
//  MainCollectionContentView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 28.10.2021.
//

import UIKit

class MainCollectionContentView: GenericBaseView<MainCollectionContentViewData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .primary
        temp.layer.cornerRadius = 10
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var collectionContentStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainerView, collectionNameLabel, collectionLabelStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 5
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .fill
        return temp
    }()
    
    private lazy var imageContainerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .center
        return temp
    }()
    
    private lazy var collectionNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.font = .setFont(fontType: .bold, size: 18)
        temp.textColor = .white
        return temp
    }()
    
    private lazy var collectionLabelStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [collectionPriceLabel, collectionDateLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 5
        temp.axis = .horizontal
        temp.distribution = .fill
        temp.alignment = .fill
        return temp
    }()
    
    private lazy var collectionPriceLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .left
        temp.font = .setFont(fontType: .medium, size: 16)
        temp.textColor = .white
        return temp
    }()
    
    private lazy var collectionDateLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .right
        temp.font = .setFont(fontType: .regular, size: 14)
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
        collectionNameLabel.text = data.name
        collectionPriceLabel.text = data.price
        collectionDateLabel.text = data.releaseDate
        imageView.image = data.image
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(collectionContentStackView)
        imageContainerView.addSubview(imageView)
        
        containerView.expandView(to: self)
        collectionContentStackView.expandView(to: containerView)
        imageView.centerView(to: imageContainerView)
    }
    
}
