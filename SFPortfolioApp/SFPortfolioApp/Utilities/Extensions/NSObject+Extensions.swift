//
//  NSObject+Extensions.swift
//  SFPortfolioApp
//
//  Created by Svetlomir Petrov on 30.06.21.
//

import Foundation

extension NSObject {
    
    static var typeName: String {
        return String(describing: self)
    }
    
}
