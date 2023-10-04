//
//  Checkbox.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 30/09/23.
//

import UIKit

class Checkbox: UIButton {
    // MARK: Properties
    var onStateChanged: (() -> Void) = {}
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        setupCheckBox(title: currentTitle)
        addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }
    
    @objc private func clickAction(_ sender: UIButton) {
        isSelected = !isSelected
        
        onStateChanged()
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        setupCheckBox(title: title)
    }
    
    private func setupCheckBox(title: String?) {
        let textColor = ColorEnum.getColor(of: .textLight)
        let iconColor = ColorEnum.getColor(of: .backgroundButton)
        setupState(.normal, title: title, textColor: textColor, iconCode: .unchecked, iconColor: iconColor)
        setupState(.selected, title: title, textColor: textColor, iconCode: .checked, iconColor: iconColor)
        setupState([.normal, .disabled], title: title, textColor: .gray, iconCode: .unchecked, iconColor: .gray)
        setupState([.selected, .disabled], title: title, textColor: .gray, iconCode: .checked, iconColor: .gray)
    }
    
    private func setupState(_ state: UIControl.State, title: String?, textColor: UIColor, iconCode: CheckboxIconEnum, iconColor: UIColor) {
        // Este método foi construído com auxílio do chatGPT
        
        // Crie um NSMutableAttributedString com o texto e o marcador de posição para o ícone
        let attributedText = NSMutableAttributedString(string: "\u{FFFC} \(title ?? String())")
        
        // Defina os atributos de estilo para o texto
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: UIFont.systemFont(ofSize: FontSizeEnum.getSize(of: .textSmall))
        ]

        // Aplique os atributos de estilo ao texto
        attributedText.addAttributes(textAttributes, range: NSRange(location: 0, length: attributedText.length))

        // Crie um sistema de ícone
        let systemImage = NSTextAttachment()
        systemImage.image = UIImage(systemName: iconCode.imageName)?.withTintColor(iconColor)
        
        // Crie um NSAttributedString com o sistema de ícone e aplique os atributos de estilo
        let imageAttributedString = NSAttributedString(attachment: systemImage)
        let mutableImageAttributedString = NSMutableAttributedString(attributedString: imageAttributedString)

        // Defina o valor de kern (espaçamento entre caracteres) para criar um espaço
        let kernValue: CGFloat = 3.0
        attributedText.addAttribute(.kern, value: kernValue, range: NSRange(location: 1, length: 1))

        // Encontre a posição do marcador de posição
        if let range = attributedText.string.range(of: "\u{FFFC}") {
            let nsRange = NSRange(range, in: attributedText.string)

            // Substitua o marcador de posição pelo NSAttributedString da imagem
            attributedText.replaceCharacters(in: nsRange, with: mutableImageAttributedString)
        }

        // Defina o texto atribuído ao botão
        setAttributedTitle(attributedText, for: state)
    }
}
