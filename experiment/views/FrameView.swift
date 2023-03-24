//
//  FrameView.swift
//  experiment
//
//  Created by Antonio Virgone on 24/03/23.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        Text("Hello, World!")
            .background(.green)
            .frame(width: 300, height: 300, alignment: .center)
            .background(.red)
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
