//
//  DetailViewController.swift
//  myTunes
//
//  Created by Hüsnü Taş on 31.10.2021.
//

import Foundation

class DetailViewController: BaseViewController<DetailViewModel> {
    
    private var detailView: DetailView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addComponents()
        addViewModelListeners()
    }
    
    private func addComponents() {
        detailView = DetailView()
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        detailView.expandView(to: view)
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeDataResult { [weak self] result in
            DispatchQueue.main.async {
                self?.setDetailViewData(by: result)
            }
        }
    }
    
    private func setDetailViewData(by data: SearchDataResult) {
        detailView.setData(by: DetailViewData(topViewData: DetailTopViewData(imageUrl: data.artworkUrl100, name: data.collectionName ?? data.trackName ?? "", price: data.formattedPrice ?? "$\(data.collectionPrice ?? data.price ?? 0.0)", releaseDate: data.releaseDate ?? data.currentVersionReleaseDate ?? "", artistName: data.artistName ?? ""), descriptionViewData: DetailDescriptionLabelViewData(titleText: "Description", descriptionText: data.description ?? data.longDescription ?? data.shortDescription ?? "-")))
    }
    
}
