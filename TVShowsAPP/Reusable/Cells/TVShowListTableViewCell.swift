//
//  TVShowListTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import UIKit
import Nuke

class TVShowsListTableViewCell: UICollectionViewCell {
    static let identifier = String(describing: type(of: self))
    let imageView = UIImageView()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImageView() {
        addSubview(imageView)
        imageView.layer.cornerRadius = 8
        imageView.image = Stylesheet.Images.placeholderPoster
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        imageView.backgroundColor = .random()
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "TitleCool"
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    

    func setupImage(url: URL?) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        guard let url = url else {
            self.imageView.image = Stylesheet.Images.placeholderPosterNotAvailable
            return
        }
        let request = ImageRequest(url: url, processors: [
            ImageProcessors.RoundedCorners(radius: 8)
        ])
        Nuke.loadImage(with: request, options: options, into: imageView)
    }
}
