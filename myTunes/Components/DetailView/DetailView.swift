//
//  DetailView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailView: GenericBaseView<DetailViewData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .background
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [topView, descriptionView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.distribution = .fill
        temp.spacing = 30
        return temp
    }()
    
    private lazy var topView: DetailTopView = {
        let temp = DetailTopView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var descriptionView: DetailDescriptionLabelView = {
        let temp = DetailDescriptionLabelView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        topView.setData(by: data.topViewData)
        descriptionView.setData(by: data.descriptionViewData)
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
        
        mainStackView.expandView(to: containerView)
    }
    
}
