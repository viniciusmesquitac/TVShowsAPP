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
        self.title = "TV Shows"
        self.navigationController?.title = "Home"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        mainView.showsListCollectionView.backgroundColor = .systemBackground
        mainView.showsListCollectionView.delegate = self
        mainView.showsListCollectionView.dataSource = self

        coordinator = ShowsListCoordinator(navigationController: navigationController)
         viewModel.getListOfShows()

        viewModel.handleUpdate = {
             self.mainView.showsListCollectionView.reloadData()
        }

    }

}

extension ShowsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {

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

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionFooter:
            guard let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: LoadingIndicatorView.identifier,
                    for: indexPath) as? LoadingIndicatorView else { return UICollectionReusableView() }
            footerView.startAnimating()
            footerView.backgroundColor = .clear
            return footerView

        default:
            assert(false, "Unexpected element kind")
        }
    }

}

// Pagination
extension ShowsListViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let scrollViewHeight = scrollView.frame.height
        if position > mainView.showsListCollectionView.contentSize.height - 100 - scrollViewHeight {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                self.viewModel.getListOfShows(page: self.viewModel.currentPage + 1)
            }
        }
    }
}
