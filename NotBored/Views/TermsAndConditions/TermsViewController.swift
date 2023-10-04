//
//  TermsViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 04/10/23.
//

import UIKit

class TermsViewController: UIViewController {

    // MARK: Screen objects
    private lazy var termsView: TermsView = {
        let view = TermsView()
        view.backgroundColor = ColorEnum.getColor(of: .background)
        view.delegate = self
        return view
    }()
    
    // MARK: Life cycle methods
    override func loadView() {
        view = termsView
    }
}

// MARK: - Terms view delegate
extension TermsViewController: TermsDelegateProtocol {
    // MARK: - Navigation methods
    internal func returnToStart() {
        dismiss(animated: true)
    }
}
