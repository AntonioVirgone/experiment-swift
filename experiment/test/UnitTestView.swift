//
//  UnitTestView.swift
//  experiment
//
//  Created by Antonio Virgone on 25/03/23.
//

import SwiftUI

struct UnitTestView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        Form {
            VStack(spacing: 20) {
                Text("\(vm.convertedText)")
                    .font(.headline)
                TextField("Enter a value.", text: $vm.text)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .submitLabel(.done)
                
                Button("Convert") {
                    vm.convertMoney()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct UnitTestView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestView()
    }
}
