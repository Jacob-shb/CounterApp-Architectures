//
//  CleanCounterViewState.swift
//  CounterApp
//
//  Created by Jacob  on 23.01.2026.
//

import SwiftUI
import Combine

class CleanCounterViewState: ObservableObject, CleanCounterPresenterToViewProtocol {
    @Published var counterValue: Int = 0
    
    func updateCounter(value: Int) {
        counterValue = value
    }
}
