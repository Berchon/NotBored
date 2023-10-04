//
//  FontSizeEnum.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 01/10/23.
//

import Foundation

enum FontSizeEnum {
    case title
    case text
    case textSmall
    case textBig
    
    var sizeValue: CGFloat {
        switch self {
        case .title:
            return 40
        case .text:
            return 18
        case .textSmall:
            return 14
        case .textBig:
            return 26
        }
    }
    
    static func getSize(of element: FontSizeEnum) -> CGFloat {
        return element.sizeValue
    }
}
