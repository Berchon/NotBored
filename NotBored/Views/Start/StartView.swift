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
        label.text = "Not Bored"
        return label
    }()
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: View code
extension StartView: ViewCode {
    func setupSubViews() {
        addSubview(titleLabel)
    }
    
    func setupConstrains() {
        
    }
    
    
}
