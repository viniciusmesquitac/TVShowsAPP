//
//  PinConfigViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 07/04/21.
//

import UIKit

class PinConfigViewController: UIViewController {
    let authTextField = AuthenticationTextField()
    let titleInformationAuthLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        self.navigationItem.rightBarButtonItem?.tintColor = Stylesheet.Color.primaryColor
        self.view.backgroundColor = Stylesheet.Color.backgroundColor
        setupAuthTextField()
        setupTitleInformationAuthLabel()
    }

    func setupAuthTextField() {
        view.addSubview(authTextField)
        authTextField.configure()
        authTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-12)
            make.centerX.equalToSuperview()
            make.height.equalTo(authTextField.height)
            make.width.equalTo(authTextField.width)
        }
    }

    func setupTitleInformationAuthLabel() {
        view.addSubview(titleInformationAuthLabel)
        titleInformationAuthLabel.textAlignment = .center
        titleInformationAuthLabel.text = "Please write your pin code"
        titleInformationAuthLabel.font = Stylesheet.Font.boldOfSize16
        titleInformationAuthLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(authTextField).offset(-76)
        }
    }

    @objc func didTapCancel() {
        self.dismiss(animated: true)
    }
}
