//
//  ContentView.swift
//  Slider Game SwiftUI
//
//  Created by Vladislav on 02.08.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Double.random(in: 0...100)
    @State private var currentValue = 0.0
    
    @State private var alertBool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Подвинь слайдер, как можно ближе к: \(lround(targetValue))")
            }
            
            HStack {
                Text("0")
                SliderUIKit(targetValue: targetValue, sliderValue: $currentValue)
                Text("100")
            }
            
            Button(action: {
                self.alertBool = true
                self.targetValue = Double.random(in: 0...100)
            }) {
                Text("Проверь меня")
            }
            .padding()
            .alert(isPresented: $alertBool) {
                Alert(title: Text("Your Score: \(computeScore())"),
                      dismissButton: .default(Text("Got it!")))
            }
            
            Button(action: {self.targetValue = Double.random(in: 0...100)}) {
                Text("Начать заново")
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - lround(difference)
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
