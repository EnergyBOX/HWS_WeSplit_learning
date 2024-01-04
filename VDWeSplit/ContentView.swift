//
//  ContentView.swift
//  VDWeSplit
//
//  Created by Server Admin on 04.01.2024.
//

import SwiftUI

struct ContentView: View {
    private var personens = ["Harry", "Hermiona", "Ron"]
    @State private var selectPerson = "Harry"
    
    var body: some View {
        NavigationStack{
            Form {
                ForEach (personens, id: \.self) {
                    Text (String($0))
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
