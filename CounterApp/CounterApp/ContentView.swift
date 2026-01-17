//
//  ContentView.swift
//  CounterApp
//
//  Created by Jacob  on 12.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedArchitecture: Architecture = .mvvm
    
    enum Architecture: String, CaseIterable {
        case mvvm = "MVVM"
        case viper = "VIPER"
    }
    
    var body: some View {
        VStack {
            Picker("Architecture", selection: $selectedArchitecture) {
                ForEach(Architecture.allCases, id: \.self) { arch in
                    Text(arch.rawValue).tag(arch)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch selectedArchitecture {
            case .mvvm:
                CounterView()
            case .viper:
                CounterBuilder.build()
            }
        }
    }
}

#Preview {
    ContentView()
}
