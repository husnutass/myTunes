//
//  DetailTopView.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import UIKit

class DetailTopView: GenericBaseView<DetailTopViewData> {
    
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
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainerView, infoStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 8
        temp.axis = .horizontal
        temp.distribution = .fillEqually
        temp.alignment = .fill
        return temp
    }()
    
    private lazy var imageContainerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.heightAnchor.constraint(equalToConstant: 150).isActive = true
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    private lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        return temp
    }()
    
    private lazy var infoStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [detailNameLabel, artistNameLabel, emptyStackView, collectionLabelStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 5
        temp.axis = .vertical
        temp.distribution = .equalSpacing
        temp.alignment = .fill
        return temp
    }()
    
    private lazy var detailNameLabel: UILabel = {
        let temp = UILabel(frame: .zero)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .left
        temp.lineBreakMode = .byTruncatingTail
        temp.numberOfLines = 2
        temp.font = .setFont(fontType: .bold, size: 18)
        temp.textColor = .white
        return temp
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .left
        temp.lineBreakMode = .byTruncatingTail
        temp.numberOfLines = 2
        temp.font = .setFont(fontType: .bold, size: 16)
        return temp
    }()
    
    private lazy var emptyStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.spacing = 20
        temp.axis = .vertical
        temp.distribution = .fill
        temp.alignment = .fill
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
        temp.textColor = .silver
        return temp
    }()
    
    private lazy var collectionDateLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .right
        temp.font = .setFont(fontType: .regular, size: 14)
        temp.textColor = .silverlight
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    override func loadViewData() {
        super.loadViewData()
        guard let data = returnData() else { return }
        detailNameLabel.text = data.name
        collectionPriceLabel.text = data.price
        let formattedDate = formatDate(date: data.releaseDate)
        collectionDateLabel.text = formattedDate
        imageView.loadImage(from: data.imageUrl, UIImage.logo100)
        artistNameLabel.text = data.artistName
        artistNameLabel.textColor = data.categoryColor ?? .movies
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        imageContainerView.addSubview(imageView)
        
        containerView.expandView(to: self)
        mainStackView.expandView(to: containerView, with: 10)
        imageView.centerView(to: imageContainerView)
        collectionPriceLabel.widthAnchor.constraint(equalTo: collectionLabelStackView.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    private func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let dateObj: Date? = dateFormatterGet.date(from: date)
        
        return dateFormatter.string(from: dateObj ?? Date())
    }
    
}
