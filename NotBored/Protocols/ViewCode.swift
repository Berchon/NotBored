//
//  ViewCode.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 29/09/23.
//

import Foundation

public protocol ViewCode {
    func setupSubViews()
    func setupConstrains()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    public func setup(){
        setupSubViews()
        setupConstrains()
        setupExtraConfiguration()
    }
    
    public func setupExtraConfiguration() { }
}
