//
//  ShowsListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class ShowsListViewController: UIViewController {

    let viewModel = ShowListViewModel()
    let mainView = ShowsListView()
    var coordinator: ShowsListCoordinator?

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.showsListCollectionView.backgroundColor = .brown
        mainView.showsListCollectionView.delegate = self
        mainView.showsListCollectionView.dataSource = self

        // viewModel.getListOfShows(page: 1)
    }

}

extension ShowsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SeriesListCollectionViewCell.identifier,
                for: indexPath)
                as? SeriesListCollectionViewCell else { return UICollectionViewCell() }

        let tvShow = viewModel.getTvShow(at: indexPath.row)
        cell.backgroundColor = .blue
        cell.contentView.layer.backgroundColor = UIColor.blue.cgColor
        return cell
    }

}
