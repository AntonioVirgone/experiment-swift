//
//  GenericView.swift
//  experiment
//
//  Created by Antonio Virgone on 22/03/23.
//

import SwiftUI

struct CallBackView: View {
    @State var valueBool = false

    var body: some View {
        VStack {
            MyContentView(doSomething: self.doSomething)
            MenuView(doSomething: self.doSomething2)
        }
    }
    
    func doSomething() -> Bool {
        print("do something")
        valueBool.toggle()
        return valueBool
    }
    
    func doSomething2() {
        print("do something")
    }
}

struct MyContentView : View {
    @State var value = false
    
    var doSomething : () -> Bool
    var body: some View {
        VStack {
            if value {
                Text("Hello!")
            }
            
            Button(action: { value = self.doSomething() }) { Text("do something") }
        }
    }
}

struct MenuView : View {
    var doSomething : () -> ()
    var body: some View {
        Button(action: { self.doSomething() }) { Text("Menu do something") }
    }
}

struct CallBackView_Previews: PreviewProvider {
    static var previews: some View {
        CallBackView()
    }
}
