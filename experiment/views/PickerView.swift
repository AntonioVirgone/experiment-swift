//
//  PickerView.swift
//  experiment
//
//  Created by Antonio Virgone on 28/04/23.
//

import SwiftUI

struct PickerView: View {
    @State private var numberOfRectangles = 3
    
    let numbers = [Int](0...10)
    
    var body: some View {
        VStack {
            HStack {
                Picker("Number of Rectangles", selection: $numberOfRectangles) {
                    ForEach(0..<numbers.count, id: \.self) { index in
                        Text("\(self.numbers[index])")
                    }
                }
                .frame(width: 50).clipped()
                
                Text("\(numberOfRectangles)")
                    .foregroundColor(.blue)
            }
            
            // now how to pass numberOfRectangles - I think I need a struct or something
            HStack {
                ForEach(0..<numberOfRectangles, id: \.self) { index in
                    ZStack {
                        Rectangle().foregroundColor(.gray)
                        Text("\(index)")
                    }
                }
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
