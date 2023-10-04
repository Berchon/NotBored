//
//  CheckboxIconEnum.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 29/09/23.
//

import Foundation

enum CheckboxIconEnum: String {
    case checked
    case unchecked
    
    var imageName: String {
        switch self {
        case .checked:
            return "checkmark.square.fill"
        case .unchecked:
            return "square"
        }
    }
}
