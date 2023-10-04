//
//  ColorEnum.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 01/10/23.
//

import UIKit

enum ColorEnum {
    case titleYellow
    case title
    case titleNavigation
    case textLight
    case background
    case backgroundNavigation
    case backgroundCard
    case selectedSegmented
    case backgroundSegmented
    case backgroundButton
    
    var colorValue: UIColor {
        switch self {
        case .titleYellow, .selectedSegmented, .backgroundButton:
            return UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        case .title, .textLight:
            return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        case .titleNavigation:
            return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .background:
            return UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
        case .backgroundNavigation:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .backgroundCard:
            return UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
        case .backgroundSegmented:
            return UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 0.25)
        }
    }
    
    static func getColor(of element: ColorEnum) -> UIColor {
        return element.colorValue
    }
}
