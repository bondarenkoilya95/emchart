//
//  File.swift
//  
//
//  Created by Ilya Bondarenko on 21.06.2022.
//

import Foundation
import UIKit

public struct DataItem {
    
    private(set) var title: String
    
    private(set) var value: Float
    
    private(set) var color: UIColor?
    
    public init(title: String, value: Float, color: UIColor? = nil) {
        self.title = title
        self.value = value
        self.color = color
    }
}

extension Array where Element == DataItem {
    
    var titles: [String] {
        var _titles = [String]()
        
        for item in self {
            _titles.append(item.title)
        }
        
        return _titles
    }
    
    var values: [Float] {
        var _values = [Float]()
        
        for item in self {
            _values.append(item.value)
        }
        
        return _values
    }
}
