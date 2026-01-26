//
//  CleanVIPERBuilder.swift
//  CounterApp
//
//  Created by Jacob  on 23.01.2026.
//

import SwiftUI

class CleanVIPERBuilder {
    static func build() -> some View {
        
        // Data Layer
        let dataSource = CounterLocalDataSource()
        let repository = CounterRepository(dataSource: dataSource)
        
        // Domain Layer (UseCases)
        let getCounterUseCase = GetCounterUseCase(repository: repository)
        let incrementUseCase = IncrementCounterUseCase(repository: repository)
        let decrementUseCase = DecrementCounterUseCase(repository: repository)
        let resetUseCase = ResetCounterUseCase(repository: repository)
        
        // Presentation Layer (VIPER)
        let viewState = CleanCounterViewState()
        let interactor = CleanCounterInteractor(
            getCounterUseCase: getCounterUseCase,
            incrementUseCase: incrementUseCase,
            decrementUseCase: decrementUseCase,
            resetUseCase: resetUseCase
        )
        let presenter = CleanCounterPresenter()
        
        // Connect
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewState
        
        let view = CleanCounterVIPERView(presenter: presenter, viewState: viewState)
        
        return view
    }
}
