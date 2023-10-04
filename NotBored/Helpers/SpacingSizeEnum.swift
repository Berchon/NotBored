//
//  SpacingSizeEnum.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 02/10/23.
//

import Foundation

enum SpacingSizeEnum: CGFloat {
    case tiny = 2
    case extraSmall = 4
    case small = 8
    case standard = 16
    case medium = 24
    case large = 32
    case extraLarge = 40
    
    static func getSize(of element: SpacingSizeEnum) -> CGFloat {
        return element.rawValue
    }
}
