//
//  ToggleDarkModeView.swift
//  experiment
//
//  Created by Antonio Virgone on 27/03/23.
//

import SwiftUI

struct ToggleDarkModeView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    HStack{
                        Toggle("Dark Mode", isOn: $isDarkMode)
                    }
                }
                Text("Lorem Ipsum")
            }
        }
    }
}

struct ToggleDarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleDarkModeView()
    }
}
