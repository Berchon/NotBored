//
//  StartView.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 29/09/23.
//

import UIKit

class StartView: UIView {
    
    // MARK: Screen objects
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.font = UIFont.boldSystemFont(ofSize: FontSizeEnum.getSize(of: .title))
        label.textColor = ColorEnum.getColor(of: .titleYellow)
        return label
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Participants"
        label.font = UIFont.systemFont(ofSize: FontSizeEnum.getSize(of: .text))
        label.textColor = ColorEnum.getColor(of: .textLight)
        return label
    }()
    
    private lazy var participantsTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = ColorEnum.getColor(of: .backgroundCard)
        textField.textColor = ColorEnum.getColor(of: .textLight)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        return textField
    }()
    
    private lazy var participantsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [participantsLabel, participantsTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = SpacingSizeEnum.getSize(of: .small)
        return stackView
    }()
    
    private lazy var priceSegmentedControl: UISegmentedControl = {
        let segmentItem = ["Free", "Low", "Medium", "High"]
        let segmentedControl = UISegmentedControl(items: segmentItem)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = ColorEnum.getColor(of: .backgroundSegmented)
        segmentedControl.selectedSegmentTintColor = ColorEnum.getColor(of: .selectedSegmented)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var activityConfigurationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [participantsStackView, priceSegmentedControl])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = SpacingSizeEnum.getSize(of: .standard)
        return stackView
    }()
    
    private lazy var agreeCheckbox: Checkbox = {
        let checkbox = Checkbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.setTitle("Agree with", for: .normal)
        checkbox.onStateChanged = chackboxStateChanged
        return checkbox
    }()
    
    private lazy var termsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: ColorEnum.getColor(of: .titleYellow),
            .font: UIFont.systemFont(ofSize: FontSizeEnum.getSize(of: .text)),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedString = NSAttributedString(string: "Terms and conditions", attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [agreeCheckbox, termsButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = SpacingSizeEnum.getSize(of: .extraSmall)
        return stackView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.configuration = UIButton.Configuration.filled()
        button.tintColor = ColorEnum.getColor(of: .backgroundButton)
        let color = ColorEnum.getColor(of: .textLight)
        button.setTitleColor(color, for: .normal)
        button.setTitleColor(color, for: .disabled)
        button.configuration?.cornerStyle = .capsule
        button.isEnabled = false
        return button
    }()
    
    private lazy var displayStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, activityConfigurationStackView, termsStackView, startButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = SpacingSizeEnum.getSize(of: .medium)
        return stackView
    }()
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc func textFieldDidChange() {
        updateStartButtonState()
    }
    
    func chackboxStateChanged() {
        updateStartButtonState()
    }
    
    func updateStartButtonState() {
        let textIsValid = participantsTextFieldIsValid()
        let isCheckboxSelected = agreeCheckbox.isSelected
        startButton.isEnabled = textIsValid && isCheckboxSelected
    }
    
    func participantsTextFieldIsValid() -> Bool {
        if let text = participantsTextField.text,
           let number = Int(text),
           number > 0 {
            return true
        }
        return false
    }
    
    @objc func termsButtonTapped() {
        // TODO: Implementar a lógica de abrir o texto dos termos & condicoes
        print("clicou")
    }
    
    @objc func startButtonTapped() {
        // TODO: Implementar a lógica de chamar a outra view controller
        print("Clicou")
    }
}

// MARK: View code
extension StartView: ViewCode {
    func setupSubViews() {
        addSubview(displayStackView)
    }
    
    func setupConstrains() {
        displayStackViewConstraints()
        participantsTextFieldConstraints()
        
        startButtonConstraints()
    }
    
    private func displayStackViewConstraints() {
        let spacing = SpacingSizeEnum.getSize(of: .medium)
        let constraints = [
            displayStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: spacing),
            displayStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: spacing),
            displayStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -spacing),
            displayStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -spacing)
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func participantsTextFieldConstraints() {
        let constraints = [
            participantsTextField.leadingAnchor.constraint(equalTo: displayStackView.leadingAnchor),
            participantsTextField.trailingAnchor.constraint(equalTo: displayStackView.trailingAnchor)
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
    
    private func startButtonConstraints() {
        let height = SpacingSizeEnum.getSize(of: .extraLarge)
        let constraints = [
            startButton.centerXAnchor.constraint(equalTo: displayStackView.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 5 * height),
            startButton.heightAnchor.constraint(equalToConstant: height),
        ]
        
        constraints.forEach { constraint in
            constraint.isActive = true
        }
    }
}
