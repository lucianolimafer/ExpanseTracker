//
//  Extensions.swift
//  ExpanseTracker
//
//  Created by Luciano Lima on 09/04/22.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericBR: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "DD/MM/YYYY"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parseDate = DateFormatter.allNumericBR.date(from: self) else { return Date() }
        
        return parseDate
    }
}

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
