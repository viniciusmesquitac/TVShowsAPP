//
//  SwitchButtonTableVIewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 07/04/21.
//

import UIKit
import SnapKit

class SwitchButtonTableViewCell: UITableViewCell {
    static let identifier = String(describing: type(of: self))
    let switchButton = UISwitch()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSwitchButton()
    }

    func setupSwitchButton() {
        addSubview(switchButton)
        switchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
