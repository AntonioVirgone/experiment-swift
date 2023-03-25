//
//  UITestingView.swift
//  experiment
//
//  Created by Antonio Virgone on 25/03/23.
//

import SwiftUI

class UITestingViewModel: ObservableObject {
    let placeholderText: String = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var currentUserIsSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
}

struct UITestingView: View {
    @StateObject private var vm = UITestingViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            if vm.currentUserIsSignedIn {
                SignedInHomeView()
            }
            if !vm.currentUserIsSignedIn {
                signUpLayer
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct UITestingView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingView()
    }
}

extension UITestingView {
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(.white)
                .cornerRadius(10)
            Button {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
        }
        .padding()
    }
}

struct SignedInHomeView: View {
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    return Alert(title: Text("Hello world!"))
                }
                
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigator")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                )
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}
