//
//  BindingView.swift
//  experiment
//
//  Created by Antonio Virgone on 24/03/23.
//

import SwiftUI

struct BindingView: View {
    @State var bgColor = Color.green
    @State var title = "Title"

    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(bgColor: $bgColor, titleValue: $title)
            }
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}

struct ButtonView: View {
    @Binding var bgColor: Color
    @Binding var titleValue: String
    
    @State var bgButtonColor: Color = Color.blue
    
    var body: some View {
        Button {
            bgColor = Color.orange
            bgButtonColor = Color.pink
            titleValue = "This is TITLE!"
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(bgButtonColor)
                .cornerRadius(10)
        }
    }
}
