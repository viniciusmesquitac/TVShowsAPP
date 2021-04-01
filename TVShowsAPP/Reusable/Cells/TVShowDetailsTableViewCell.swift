//
//  TVShowDetailsTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class TVShowDetailsTableViewCell: UITableViewCell {
    static let identifier = String(describing: type(of: self))
    let contentInformationView = ContentInformationView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
  
        setupContentInformationView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupContentInformationView() {
        addSubview(contentInformationView)
        contentInformationView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
