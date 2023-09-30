//
//  Checkbox.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 30/09/23.
//

import UIKit

class Checkbox: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        setupCheckBox(title: currentTitle)
        addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    @objc func clickAction(_ sender: UIButton) {
        isSelected = !isSelected
    }
    
    private func setupState(_ state: UIControl.State, title: String?, textColor: UIColor, iconCode: CheckboxIconEnum, iconColor: UIColor) {
        let attributeString = NSMutableAttributedString(string: iconCode.rawValue, attributes: [NSAttributedString.Key.kern: 10, NSAttributedString.Key.foregroundColor: iconColor])
        
        attributeString.append(NSMutableAttributedString(string: title ?? String(), attributes: [NSAttributedString.Key.foregroundColor: textColor]))
        
        setAttributedTitle(attributeString, for: state)
    }
    
    func setupCheckBox(title: String?) {
        setupState(.normal, title: title, textColor: .black, iconCode: .unchecked, iconColor: .black)
        setupState(.selected, title: title, textColor: .black, iconCode: .checked, iconColor: .blue)
        setupState([.normal, .disabled], title: title, textColor: .gray, iconCode: .unchecked, iconColor: .gray)
        setupState([.selected, .disabled], title: title, textColor: .gray, iconCode: .checked, iconColor: .gray)
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        setupCheckBox(title: title)
    }
}
