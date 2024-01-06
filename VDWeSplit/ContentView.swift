//
//  ContentView.swift
//  VDWeSplit
//
//  Created by Server Admin on 04.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 20, 50, 0]
    
    var totalPerPerson: Double {
        let countPeople = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelected
        let grandTotal = checkAmount + tipValue
        let amountPerson = grandTotal / countPeople
        
        return amountPerson
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")//!!!!
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("How match do you want to tip ?") {
                    Picker("Percent to tip", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
