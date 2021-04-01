//
//  LoadingIndicatorView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class LoadingIndicatorView: UICollectionReusableView {

    static let identifier = "indicatorViewIdentifier"
    let spinner = UIActivityIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        spinner.center = center
        self.addSubview(spinner)
    }

    func startAnimating() {
        spinner.startAnimating()
    }
}
