//
//  Counter.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

struct Counter {

    var value: Int

    init(value: Int = 0) {
        self.value = value
    }
    
    var isAtMinimum: Bool {
        value == 0
    }
    
    func canDecrement() -> Bool {
        return value > 0
    }
}

