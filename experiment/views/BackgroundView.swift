//
//  BackgroundView.swift
//  experiment
//
//  Created by Antonio Virgone on 27/03/23.
//

import SwiftUI

struct BackgroundView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init() {
        isDarkMode = false
    }

    var body: some View {
        VStack {
            viewContent
        }
    }
}

extension BackgroundView {
    private var viewContent: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(.purple)
                    .roundedCorner(100, corners: [.bottomRight])
                    .ignoresSafeArea()
                Image("gymIcon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            ZStack {
                Rectangle()
                    .fill(.white)
                    .roundedCorner(100, corners: [.topLeft])
                    .ignoresSafeArea()
                
                bottomContent
            }
            .background(.purple)
        }
    }
    
    private var bottomContent: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Lorem ipsum dolor sit amet")
                    .font(.system(size: 24, weight: .black, design: .rounded))
                Text("Consectetur adipiscing elit")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                Text("Suspendisse eget venenatis ligula")
                    .font(.system(size: 18, weight: .light, design: .rounded))
            }
            Button("Get Start") {
                
            }
            .frame(width: 200)
            .font(.title3)
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding()
            .background(Color.purple)
            .cornerRadius(12)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundSpecificCorners: View {
    var body: some View {
        Text("DevTechie")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .roundedCorner(20, corners: [.bottomLeft, .topRight])
    }
}
