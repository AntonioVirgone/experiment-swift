//
//  ExtractSubviewsView.swift
//  experiment
//
//  Created by Antonio Virgone on 24/03/23.
//

import SwiftUI

struct ExtractSubviewsView: View {
    let color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    let color2 = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    let color3 = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    let color4 = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)

    var body: some View {
        ZStack {
            Color(color).edgesIgnoringSafeArea(.all)
            contentLayer
        }
        
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 24, color: Color(color2))
            MyItem(title: "Oranges", count: 8, color: Color(color3))
            MyItem(title: "Bananas", count: 109, color: Color(color4))
        }
    }
}

struct ExtractSubviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviewsView()
    }
}

struct MyItem: View {
    var title: String
    var count: Int
    var color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
