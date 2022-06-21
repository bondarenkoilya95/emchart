//
//  File.swift
//  
//
//  Created by Ilya Bondarenko on 20.06.2022.
//

import Foundation
import UIKit

class YInfoBar: UIView {
    
    private var currentCountOfLines: Int = 0
    private var currentMaxValue: Float = 0
    
    private var labels: [UILabel] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard labels.count > 0 else { return }
        
        let step = (Int(self.frame.height) - 50)/currentCountOfLines
        
        for (index, label) in labels.enumerated() {
            if let constraint = label.constraints.first(where: { c in
                return c.identifier == "top_margin"
            }) {
                constraint.constant = CGFloat(index*step)
            }
        }
    }
    
    func drawData(withCountOfLines lines: Int, maxValue: Float) {
        self.currentMaxValue = maxValue
        if currentCountOfLines == lines {
            return
        }
        
        currentCountOfLines = lines
        
        drawLabels()
    }
    
    private func drawLabels() {
        let values = calculateValuesForLabels()
        let step = (Int(self.frame.height) - 50)/currentCountOfLines
        
        for (index, value) in values.enumerated() {
            let label = initLabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = value
            label.sizeToFit()
            
            labels.append(label)
            addSubview(label)
            
            let top = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: CGFloat(index*step))
            top.identifier = "top_margin"
            let left = NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 4)
            let right = NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
            let height = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
            
            NSLayoutConstraint.activate([top, left, right, height])
        }
    }
    
    private func calculateValuesForLabels() -> [String] {
        var values = [String]()
        
        let maxValue = currentMaxValue == 0 ? 100 : currentMaxValue
        
        let part = maxValue/Float(currentCountOfLines)
        values.append("\(maxValue)")
        values.append("\(maxValue - part)")
        
        if currentCountOfLines == 4 {
            values.append("\(maxValue - (2*part))")
        }
        
        values.append("\(0)")
        
        return values
    }
    
    private func initLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 7)
        label.textAlignment = .left
        label.textColor = .lightGray
        
        return label
    }
}
