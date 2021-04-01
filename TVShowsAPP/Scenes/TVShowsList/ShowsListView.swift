//
//  TVShowsListView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit
import SnapKit

class ShowsListView: UIView {

    let showsListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.footerReferenceSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width/3.5, height: 161)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 18, bottom: 8, right: 18)
        collectionView.register(TVShowsListCollectionViewCell.self,
                                forCellWithReuseIdentifier: TVShowsListCollectionViewCell.identifier)
        collectionView.register(
            LoadingIndicatorView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadingIndicatorView.identifier)
        return collectionView
    }()

    let indicator: LoadingIndicatorView = {
        let indicatior = LoadingIndicatorView()
        return indicatior
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupCollectionView()
        setupIndicator()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCollectionView() {
        addSubview(showsListCollectionView)
        showsListCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.showsListCollectionView.alpha = 0
        self.showsListCollectionView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.indicator.stopAnimating()
            UIView.animate(withDuration: 0.5) {
                self.showsListCollectionView.isHidden = false
                self.showsListCollectionView.alpha = 1
            }
        }
    }

    func setupIndicator() {
        addSubview(indicator)
        indicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        indicator.startAnimating()
    }
}
