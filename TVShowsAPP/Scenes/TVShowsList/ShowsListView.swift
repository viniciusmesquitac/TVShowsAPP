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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width/3.5, height: 181)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionView.register(SeriesListCollectionViewCell.self,
                                forCellWithReuseIdentifier: SeriesListCollectionViewCell.identifier)
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
        // add subview + constraints
        addSubview(showsListCollectionView)
        showsListCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

class SeriesListCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: type(of: self))
}
