//
//  PickerDynamicView.swift
//  experiment
//
//  Created by Antonio Virgone on 28/04/23.
//

import SwiftUI

struct PickerDynamicView: View {
    @State var colorArray = ColorDataController.find()
    
    var body: some View {
        VStack{
            Spacer()
            Picker("Letters", selection: $colorArray) {
                ForEach(colorArray.indices, id: \.self) { (index: Int) in
                    Text(colorArray[index].name)
                }
            }.pickerStyle(WheelPickerStyle())
            
            
            Spacer()
            HStack(spacing: 30) {
                Button {
                    ColorDataController.save(name: "red")
                    colorArray = ColorDataController.find()
                } label: {
                    Text("Add color")
                        .frame(width: 120, height: 30)
                        .background(.gray)
                        .foregroundColor(.white)
                        .padding()
                }
                Button {
                    ColorDataController.delete()
                    colorArray = ColorDataController.find()
                } label: {
                    Text("Delete colors")
                        .frame(width: 120, height: 30)
                        .background(.gray)
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
    }
}

struct PickerDynamicView_Previews: PreviewProvider {
    static var previews: some View {
        PickerDynamicView().environment(\.managedObjectContext, ColorDataController.context)
    }
}
