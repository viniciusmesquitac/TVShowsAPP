//
//  AuthenticationTextField.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 08/04/21.
//

import Foundation
import UIKit

protocol AuthenticationTextFieldDelegate: class {
    func didRequestAuth(pinCode: String)
}
class AuthenticationTextField: UITextField {
    private var digitLabels: [UILabel] = []
    weak var authDelegate: AuthenticationTextFieldDelegate?
    var spaceCircles = CGFloat(6)
    var slotCount = 6
    var height = CGFloat(32)

    var width: CGFloat {
        return (height * CGFloat(slotCount) + spaceCircles * CGFloat(slotCount))
    }

    func configure(with slotCount: Int = 6) {
        self.slotCount = slotCount
        configureTextField()
        // Create stackview and add it to subview
        let labelStackView = createTextFieldStackView(with: slotCount)
        addSubview(labelStackView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        labelStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc func didTap() {
        self.becomeFirstResponder()
    }

    @objc func textFieldDidChange() {
        self.verifyDigitLabelsPosition()
        if text?.count == slotCount {
            self.authDelegate?.didRequestAuth(pinCode: text!)
        }
    }

    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        backgroundColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        textDragInteraction?.isEnabled = false
        autocorrectionType = .no
        selectedTextRange = .none
        delegate = self
    }

    private func createTextFieldStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = spaceCircles

        for _ in 1...count {
            let label = createLabel()
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }

        return stackView
    }

    private func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Stylesheet.Font.boldOfSize16
        label.layer.backgroundColor = Stylesheet.Color.backgroundColor.cgColor
        label.layer.cornerRadius = height/2
        label.layer.borderWidth = 1
        label.layer.borderColor = Stylesheet.Color.primaryColor.cgColor
        label.isUserInteractionEnabled = true
        return label
    }

    private func verifyDigitLabelsPosition() {
        guard let text = self.text, text.count <= digitLabels.count else { return }

        for iterator in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[iterator]
            if iterator < text.count {
                currentLabel.text = ""
                currentLabel.layer.backgroundColor = Stylesheet.Color.primaryColor.cgColor
            } else {
                currentLabel.text?.removeAll()
                currentLabel.layer.backgroundColor = Stylesheet.Color.backgroundColor.cgColor
            }
        }
    }
}

// MARK: Evitar que o texto digitado exceda a quantidade maxima de labels
extension AuthenticationTextField: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let charactererCount = textField.text?.count else { return false }
        // Should trigger an error if string == "" or digitLabel.count > characterCount
        return charactererCount <= digitLabels.count - 1 || string == ""
    }
}
