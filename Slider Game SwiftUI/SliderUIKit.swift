//
//  SliderUIKit.swift
//  Slider Game SwiftUI
//
//  Created by Vladislav on 03.08.2020.
//  Copyright © 2020 Vladislav Cheremisov. All rights reserved.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    
    var targetValue: Double
    @Binding var sliderValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .red
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.alpha = CGFloat(1 - (abs(targetValue - sliderValue) * 0.01))
    }
    
    func makeCoordinator() -> SliderUIKit.Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension SliderUIKit {
    
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
    
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(targetValue: 50, sliderValue: .constant(10))
    }
}
