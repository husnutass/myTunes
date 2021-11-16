//
//  LoadingViewController.swift
//  myTunes
//
//  Created by Hüsnü Taş on 16.11.2021.
//

import UIKit

class LoadingViewController: UIViewController {

    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return temp
    }()
    
    private lazy var spinnerView: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView(style: .large)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spinnerView.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        spinnerView.stopAnimating()
    }
    
    private func addComponents() {
        view.addSubview(containerView)
        containerView.addSubview(spinnerView)

        containerView.expandView(to: view)
        spinnerView.centerView(to: containerView)
    }
    
    func removeLoading() {
        view.removeFromSuperview()
    }
}
