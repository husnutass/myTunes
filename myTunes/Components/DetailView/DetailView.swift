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
        let temp = UIStackView(arrangedSubviews: [topView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.distribution = .fill
        temp.spacing = 35
        return temp
    }()
    
    private lazy var topView: DetailTopView = {
        let temp = DetailTopView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var scrollView: UIScrollView = {
        let temp = UIScrollView()
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
        addSubview(scrollView)
        scrollView.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            scrollView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            
            descriptionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        mainStackView.expandView(to: containerView)
        descriptionView.expandView(to: scrollView)
        
    }
    
}
