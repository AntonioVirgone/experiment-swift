//
//  TabBarView.swift
//  experiment
//
//  Created by Antonio Virgone on 22/03/23.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedIndex = 0
    @State var presented = false
    
    let icons = [
        "house",
        "gear",
        "plus",
        "lasso",
        "message"
    ]
        
    var body: some View {
        VStack {
            // Content
            ZStack {
                Spacer().fullScreenCover(isPresented: $presented) {
                    Button {
                        presented.toggle()
                    } label: {
                        Text("Close")
                            .frame(width: 200, height: 50)
                            .background(.pink)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                    }
                }
                
                switch selectedIndex {
                case 0:
                    HomeView()
                case 1:
                    NavigationView {
                        VStack {
                            Text("Gear Screen")
                        }
                        .navigationTitle("Setting")
                    }
                case 2:
                    NavigationView {
                        VStack {
                            Text("Add Screen")
                        }
                        .navigationTitle("Add")
                    }
                case 3:
                    NavigationView {
                        VStack {
                            Text("Lasso Screen")
                        }
                        .navigationTitle("Edit")
                    }
                case 4:
                    NavigationView {
                        VStack {
                            Text("Message Screen")
                        }
                        .navigationTitle("Message")
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("Default Screen")
                        }
                        .navigationTitle("Second")
                    }
                }
            }
            
            Divider()
                .padding(.bottom, 20)
            HStack {
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        if number == 2 {
                            presented.toggle()
                        } else {
                            selectedIndex = number
                        }
                    }, label: {
                        if number == 2 {
                            TabBarIcon(icon: icons[number], color: .white)
                                .frame(width: 60, height: 60)
                                .background(.blue)
                                .cornerRadius(30)
                        } else {
                            TabBarIcon(icon: icons[number], color: selectedIndex == number ? Color(.label) : Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
        }
    }
}

struct TabBarIcon: View {
    var icon: String
    var color: Color
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 25,
                          weight: .regular,
                          design: .default))
            .foregroundColor(color)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("House Screen")
            }
            .navigationTitle("House")
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
