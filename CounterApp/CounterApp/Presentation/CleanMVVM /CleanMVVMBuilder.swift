//
//  CleanMVVMBuilder.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import SwiftUI

class CleanMVVMBuilder {
    static func build() -> some View {
        // data layer
        let dataSource = CounterLocalDataSource()
        let repository = CounterRepository(dataSource: dataSource)
        
        // domain layer (UseCases)
        let getCounterUseCase = GetCounterUseCase(repository: repository)
        let incrementUseCase = IncrementCounterUseCase(repository: repository)
        let decrementUseCase = DecrementCounterUseCase(repository: repository)
        let resetUseCase = ResetCounterUseCase(repository: repository)
        
        let viewModel = CleanCounterViewModel(
            getCounterUseCase: getCounterUseCase,
            incrementUseCase: incrementUseCase,
            decrementUseCase: decrementUseCase,
            resetUseCase: resetUseCase
        )
        
        return CleanCounterView(viewModel: viewModel)
    }
}
