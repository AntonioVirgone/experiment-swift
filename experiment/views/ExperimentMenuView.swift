//
//  ExperimentMenuView.swift
//  experiment
//
//  Created by Antonio Virgone on 24/03/23.
//

import SwiftUI

struct ExperimentMenuView: View {
    @State private var showingScreen = false
    @State private var page = "ColorView"
    
    var views = [
        "ColorView",
        "TabBarView",
        "CallBackView",
        "FrameView",
        "ExtractSubviewsView",
        "BindingView",
        "AnimationView",
        "ObservableObjectView",
        "UnitTestView"
    ]
    
    var textButtonColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    var bgButtonColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
    var body: some View {
        VStack {
            NavigationStack {
                List(views, id: \.self) { view in
                    Button(action: {
                        page = view
                        showingScreen.toggle()
                    }, label: {
                        Text(view)
                            .foregroundColor(Color(textButtonColor))
                            .frame(width: 300, height: 50, alignment: .center)
                            .background(Color(bgButtonColor))
                            .cornerRadius(20)
                    })
                }
                .navigationDestination(isPresented: $showingScreen) {
                    switch page {
                    case "ColorView":
                        ColorView()
                    case "TabBarView":
                        TabBarView()
                    case "CallBackView":
                        CallBackView()
                    case "FrameView":
                        FrameView()
                    case "ExtractSubviewsView":
                        ExtractSubviewsView()
                    case "BindingView":
                        BindingView()
                    case "AnimationView":
                        AnimationView()
                    case "ObservableObjectView":
                        ObservableObjectView()
                    case "UnitTestView":
                        UnitTestView()
                    default:
                        ColorView()
                    }
                }
            }
        }
    }
}

struct MenuElement: Identifiable {
    var id = UUID()
    var title: String
    var view: any View
}

struct ExperimentMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentMenuView()
    }
}
