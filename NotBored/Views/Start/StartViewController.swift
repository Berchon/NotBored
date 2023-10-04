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
        view.backgroundColor = ColorEnum.getColor(of: .background)
        view.delegate = self
        return view
    }()
    
    // MARK: Life cycle methods
    override func loadView() {
        view = startView
    }
}

// MARK: - Initial view delegate
extension StartViewController: StartDelegateProtocol {
    // MARK: - Navigation methods
    internal func navigateToTerms() {
        let termsViewController = TermsViewController()
        termsViewController.modalPresentationStyle = .fullScreen
        present(termsViewController, animated: true)
    }
}
