//
//  AnimationView.swift
//  experiment
//
//  Created by Antonio Virgone on 24/03/23.
//

import SwiftUI

struct AnimationView: View {
    @State var isAnimated: Bool = false
    @State var textValue: String = "Amet"
    
    var body: some View {
        VStack {
            Button("Button") {
                /*
                withAnimation(Animation.default.delay(0.5)) {
                    isAnimated.toggle()
                    textValue = isAnimated ? "Cliccato" : "Amet"
                }
                */
                withAnimation(Animation.default.repeatCount(5, autoreverses: true)) {
                    isAnimated.toggle()
                    textValue = isAnimated ? "Cliccato" : "Amet"
                }
                /*
                withAnimation(Animation.default.repeatForever(autoreverses: true)) {
                    isAnimated.toggle()
                    textValue = isAnimated ? "Cliccato" : "Amet"
                }
                 */
            }
            Spacer()
            VStack {
                Text("Lorem ipsum")
                Text("Dolor sit")
                Text(textValue)
            }
            .frame(
                width: isAnimated ? 150 : 300,
                height: isAnimated ? 400 : 300
            )
            .background(isAnimated ? .green : .red)
            .cornerRadius(isAnimated ? 50 :  25)
            .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
            .offset(y: isAnimated ? 100 : 0)
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 :  25)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 100 : 0)
            Spacer()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
