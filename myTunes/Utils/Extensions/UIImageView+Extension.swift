//
//  UIImageView+Extension.swift
//  myTunes
//
//  Created by Hüsnü Taş on 30.10.2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(from url: String, _ placeholder: UIImage?) {
        guard let url = URL(string: url) else { return }
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(0.3))], completionHandler: nil)
    }
}
