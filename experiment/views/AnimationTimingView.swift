//
//  AnimationTimingView.swift
//  experiment
//
//  Created by Antonio Virgone on 24/03/23.
//

import SwiftUI

struct AnimationTimingView: View {
    @State var isAnimated = false
    let timing: Double = 5.0
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimated.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.default)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.spring())
            // Effetto accelleraizione smorzata. giocando sul dampingFraction si può ottenere l'effetto molla
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.spring(
                    response: 0.5,
                    dampingFraction: 0.7,
                    blendDuration: 1.0
                ))
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing))
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.easeIn(duration: timing))
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing))
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(Animation.easeOut(duration: timing))
        }
    }
}

struct AnimationTimingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingView()
    }
}
