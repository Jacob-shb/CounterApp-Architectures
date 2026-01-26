//
//  CleanCounterVIPERView.swift
//  CounterApp
//
//  Created by Jacob  on 23.01.2026.
//

import SwiftUI

struct CleanCounterVIPERView: View {
    var presenter: CleanCounterViewToPresenterProtocol
    @ObservedObject var viewState: CleanCounterViewState
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Counter App (Clean VIPER)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(viewState.counterValue)")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.orange)
            
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
                    .foregroundColor(.white)
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
