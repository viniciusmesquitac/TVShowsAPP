//
//  ResultsShowListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 02/04/21.
//

import UIKit

class ResultsShowsListViewController: UIViewController {
    let viewModel = ShowListViewModel()
    let mainView = ShowsListView()
    var coordinator: ShowsListCoordinator?

    init(coordinator: ShowsListCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        mainView.showsListCollectionView.backgroundColor = .systemBackground
        mainView.showsListCollectionView.delegate = self
        mainView.showsListCollectionView.dataSource = self

        viewModel.handleUpdate = {
            self.mainView.showsListCollectionView.reloadData()
        }
    }

}

extension ResultsShowsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.details(tvShow: viewModel.tvShows[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TVShowsListCollectionViewCell.identifier,
                for: indexPath)
                as? TVShowsListCollectionViewCell else { return UICollectionViewCell() }

        let tvShow = viewModel.getTvShow(at: indexPath.row)
        let url = URL(string: tvShow?.image?.medium ?? "")
        cell.setupImage(url: url)
        return cell
    }

}
