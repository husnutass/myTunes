//
//  DetailDescriptionLabelView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailDescriptionLabelView: GenericBaseView<DetailDescriptionLabelViewData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .background
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.distribution = .fill
        temp.spacing = 10
        return temp
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .white
        temp.font = .setFont(fontType: .bold, size: 20)
        temp.textAlignment = .left
        return temp
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .white
        temp.font = .setFont(fontType: .regular, size: 16)
        temp.textAlignment = .left
        temp.numberOfLines = 0
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        titleLabel.text = data.titleText
        descriptionLabel.text = data.descriptionText
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        containerView.expandView(to: self)
        mainStackView.expandView(to: containerView)
    }
    
}
