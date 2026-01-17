//
//  CounterBuilder.swift
//  CounterApp
//
//  Created by Jacob  on 17.01.2026.
//

import SwiftUI

class CounterBuilder {
    static func build() -> some View {
        let viewState = CounterViewState()
        let interactor = CounterInteractor()
        let presenter = CounterPresenter()
//        let router = CounterRouter()
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewState
        
        let view = CounterVIPERView(presenter: presenter, viewState: viewState)
        
        return view
    }
}
