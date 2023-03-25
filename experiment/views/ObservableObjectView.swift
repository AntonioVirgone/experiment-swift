//
//  ObservableObjectView.swift
//  experiment
//
//  Created by Antonio Virgone on 25/03/23.
//

import SwiftUI

class UserProgress: ObservableObject {
    @Published var score = 0
}

struct InnerView: View {
    @ObservedObject var userProgress: UserProgress
    
    var body: some View {
        Button("Score up") {
            userProgress.score += 1
        }
    }
}

struct ResetView: View {
    @ObservedObject var userProgress: UserProgress
    
    var body: some View {
        Button("Reset score") {
            userProgress.score = 0
        }
        .foregroundColor(.red)
    }
}

struct ObservableObjectView: View {
    @StateObject var userProgress = UserProgress()
    
    var body: some View {
        VStack {
            Text("Score is \(userProgress.score)")
                .padding(.bottom)
            InnerView(userProgress: userProgress)
                .padding(.bottom)
            ResetView(userProgress: userProgress)
        }
    }
}

struct ObservableObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectView()
    }
}
