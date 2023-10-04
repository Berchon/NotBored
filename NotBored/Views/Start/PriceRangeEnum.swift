//
//  PriceRangeEnum.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 02/10/23.
//

import Foundation

enum PriceRangeEnum: Double {
    case free
    case low
    case medium
    case high
    
    var stringValue: String {
        switch self {
        case .free:
            return "Free"
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    func getPriceRange(with price: Double) -> PriceRangeEnum {
        switch price {
        case 0.0:
            return .free
        case 0.0...0.3:
            return .low
        case 0.3...0.6:
            return .medium
        case 0.6...1.0:
            return .high
        default:
            return .high
        }
    }
}
