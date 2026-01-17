//
//  CounterVIPERView.swift
//  CounterApp
//
//  Created by Jacob  on 17.01.2026.
//

import SwiftUI

struct CounterVIPERView: View {
    var presenter: CounterViewToPresenterProtocol
    @ObservedObject var viewState: CounterViewState
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Counter App (VIPER)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(viewState.counterValue)")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.purple)
            
            HStack(spacing: 20) {
                Button(action: {
                    presenter.decrementButtonTapped()
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    presenter.incrementButtonTapped()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                }
            }
            
            Button(action: {
                presenter.resetButtonTapped()
            }) {
                Text("Reset")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            presenter.viewDidLoad()
        }
    }
}

//#Preview {
//    let viewState = CounterViewState()
//    let interactor = CounterInteractor()
//    let presenter = CounterPresenter()
//    
//    presenter.ineractor = interactor
//    interactor.presenter = presenter
//    presenter.view = viewState
//    
//    return CounterVIPERView(presenter: presenter, viewState: viewState)
//}
