//
//  TVShowListViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit
import Nuke

class TVShowsListCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: type(of: self))
    let imageView = UIImageView()

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
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.backgroundColor = .random()
    }

    func setupImage(url: URL?) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        guard let url = url else { return }
        let request = ImageRequest(url: url, processors: [
            ImageProcessors.RoundedCorners(radius: 8)
        ])
        Nuke.loadImage(with: request, options: options, into: imageView)
    }
}
