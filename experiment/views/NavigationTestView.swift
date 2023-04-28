//
//  NavigationView.swift
//  experiment
//
//  Created by Antonio Virgone on 23/04/23.
//

import Foundation
import SwiftUI

struct NavigationTestView: View {
    let gradient = LinearGradient(colors: [Color.orange,Color.green],
                                  startPoint: .top, endPoint: .bottom)
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.green
                        .opacity(0.1)
                        .ignoresSafeArea()
                   
                    VStack {
                        Rectangle()
                            .frame(height: 0)
                            .background(Color.red.opacity(0.2))
                        Text("Have the style touching the safe area edge.")
                            .padding()
                        Spacer()
                    }
                    .navigationTitle("Nav Bar Background")
                    .font(.title2)
                }
            }
        }
}

struct NavigationTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTestView()
    }
}
