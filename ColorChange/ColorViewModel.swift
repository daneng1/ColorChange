//
//  ColorViewModel.swift
//  ColorChange
//
//  Created by Dan and Beth Engel on 8/19/23.
//

import Foundation

class ColorChange: ObservableObject {
    @Published var color: Double
    @Published var isReducing: Bool = false
    
    init(color: Double) {
        self.color = color
    }
    
    func updateColor(min: Double, max: Double) {
        if color < min {
            color = min + 0.005
            isReducing = false
        } else if color > max {
            color = max - 0.005
            isReducing = true
        } else if isReducing {
            color -= 0.005
        } else {
            color += 0.005
        }
    }
}
