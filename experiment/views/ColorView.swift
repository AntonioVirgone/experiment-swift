//
//  ContentView.swift
//  experiment
//
//  Created by Antonio Virgone on 21/03/23.
//

import SwiftUI

struct ColorView: View {
    var body: some View {
        let color = #colorLiteral(red: 1, green: 0.5099840164, blue: 0.8374777436, alpha: 1)
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //Color.red
                //Color.primary

                // la paletta va assegnata ad una variabile -> let color = #colorLiteral()
                //Color(color)
                
                // prende un set di colori direttamente dagli asset
                Color("CustomColor")
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -20, y: -20)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
