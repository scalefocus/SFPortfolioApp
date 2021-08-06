//
//  Constrained.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 9.08.21.
//

import Foundation

@propertyWrapper

/// Wraps a value of any comparable type which will be constrained in a defined closed range interval of that type.
struct Constrained<Value: Comparable> {
    
    // MARK: - Properties
    var wrappedValue: Value {
        get {
            value
        }
        set {
            value = max(min(newValue, range.upperBound), range.lowerBound)
        }
    }
    private var range: ClosedRange<Value>
    private var value: Value
    
    // MARK: - Init
    init(wrappedValue value: Value, _ range: ClosedRange<Value>) {
        self.value = value
        self.range = range
    }
    
}
