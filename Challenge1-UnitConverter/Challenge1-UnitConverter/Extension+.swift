//
//  Extension+.swift
//  Challenge1-UnitConverter
//
//  Created by Alan Silva on 21/12/20.
//

import Foundation
import SwiftUI

extension ContentView {
    
    func convertUnit(_ value: String, source: LenghtUnits, output: LenghtUnits) -> String {
        
        var sourceType: UnitLength {
            switch source {
            case .Meters:
                return .meters
            case .KM:
                return .kilometers
            case .Feet:
                return .feet
            case .Yard:
                return .yards
            case .Miles:
                return .miles
            }
        }
        
        let value = Double(value) ?? 0
        let computed = Measurement(value: value, unit: sourceType)
        
        var result: Measurement<UnitLength> {
            switch output {
            case .Meters:
                return computed.converted(to: .meters)
            case .KM:
                return computed.converted(to: .kilometers)
            case .Feet:
                return computed.converted(to: .feet)
            case .Yard:
                return computed.converted(to: .yards)
            case .Miles:
                return computed.converted(to: .miles)
            }
        }
        
        return result.description
        
    }
    
}
