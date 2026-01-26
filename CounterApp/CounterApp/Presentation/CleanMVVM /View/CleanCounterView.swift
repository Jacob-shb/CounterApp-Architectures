//
//  CleanCounterView.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import SwiftUI

struct CleanCounterView: View {
    @StateObject private var viewModel: CleanCounterViewModel
    
    init(viewModel: CleanCounterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Counter App (Clean MVVM)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(viewModel.counter.value)")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.green)
            
            HStack(spacing: 20) {
                Button(action: viewModel.decrement) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                }
                
                Button(action: viewModel.increment) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                }
            }
            
            Button(action: viewModel.reset) {
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
    }
}

