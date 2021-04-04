//
//  LoadingIndicatorView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit
import SnapKit

class LoadingIndicatorView: UICollectionReusableView {

    static let identifier = "indicatorViewIdentifier"
    let spinner = UIActivityIndicatorView()
    let messageLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.backgroundColor = .clear
        self.addSubview(spinner)
        self.addSubview(messageLabel)
        self.spinner.color = Stylesheet.Color.primaryColor
 
        spinner.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        messageLabel.font = Stylesheet.Font.boldOfSize16
        messageLabel.textColor = .darkGray
        messageLabel.isHidden = true
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    func startAnimating() {
        spinner.startAnimating()
    }

    func stopAnimating() {
         spinner.stopAnimating()
    }
}
