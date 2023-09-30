//
//  StartViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 29/09/23.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: Screen objects
    private lazy var startView: StartView = {
        let view = StartView()
        view.backgroundColor = .red
        return view
    }()
    
    // MARK: Life cycle methods
    override func loadView() {
        view = startView
    }
}
