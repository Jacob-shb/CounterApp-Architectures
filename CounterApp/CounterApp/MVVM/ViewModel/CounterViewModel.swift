//
//  CounterViewModel.swift
//  CounterApp
//
//  Created by Jacob  on 16.01.2026.
//

import Foundation
import Combine

class CounterViewModel: ObservableObject {
    @Published var counter: CounterModel
    
    init(counter: CounterModel = CounterModel()) {
        self.counter = counter
    }
    
    func increment() {
        counter.value += 1
    }
    
    func decrement() {
        guard counter.value > 0 else { return }
        counter.value -= 1
    }
    
    func reset() {
        counter.value = 0
    }
}
