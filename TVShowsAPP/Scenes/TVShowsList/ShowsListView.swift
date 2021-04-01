//
//  TVShowsListView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit
import SnapKit
import Nuke

class ShowsListView: UIView {

    let showsListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.footerReferenceSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width/3.5, height: 181)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionView.register(SeriesListCollectionViewCell.self,
                                forCellWithReuseIdentifier: SeriesListCollectionViewCell.identifier)
        collectionView.register(
            LoadingIndicatorView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadingIndicatorView.identifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCollectionView() {
        addSubview(showsListCollectionView)
        showsListCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

class SeriesListCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: type(of: self))
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.backgroundColor = .darkGray
    }

    func setupImage(url: URL?) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        guard let url = url else { return }
        Nuke.loadImage(with: url, options: options, into: imageView)
    }
}
