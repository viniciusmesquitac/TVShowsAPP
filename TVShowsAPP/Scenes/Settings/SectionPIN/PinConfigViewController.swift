//
//  PinConfigViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 07/04/21.
//

import UIKit

class PinConfigViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        self.view.backgroundColor = .systemBackground
    }

    @objc func didTapCancel() {
        self.dismiss(animated: true)
    }
}
