//
//  UIApplication+Extension.swift
//  myTunes
//
//  Created by Hüsnü Taş on 16.11.2021.
//

import UIKit

extension UIApplication {
    
    class func topViewController(_ base: UIViewController? = UIApplication
                                    .shared
                                    .connectedScenes
                                    .compactMap { $0 as? UIWindowScene }
                                    .flatMap { $0.windows }
                                    .first { $0.isKeyWindow }?.rootViewController) -> UIViewController? {
        
        if let navigationController = base as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        
        if let tabController = base as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presentedViewController = base?.presentedViewController {
            return topViewController(presentedViewController)
        }
        
        return base
    }
    
}
