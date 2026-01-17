//
//  CounterViewState.swift
//  CounterApp
//
//  Created by Jacob  on 17.01.2026.
//

import SwiftUI
import Combine

class CounterViewState: ObservableObject, CounterPresenterToViewProtocol {
    @Published var counterValue: Int = 0
    
    func updateCounter(value: Int) {
        counterValue = value
    }
}
