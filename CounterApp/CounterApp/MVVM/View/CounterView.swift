//
//  CounterView.swift
//  CounterApp
//
//  Created by Jacob  on 16.01.2026.
//

import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Counter App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\(viewModel.counter.value)")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.blue)
            
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

#Preview {
    CounterView()
}
