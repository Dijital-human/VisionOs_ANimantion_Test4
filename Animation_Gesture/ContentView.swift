//
//  ContentView.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var isOn: Bool = false
    @State private var extraInfo: String = ""
    @State private var extraEmaund: CGFloat = 0.45
    var body: some View {
        VStack(alignment:.center) {
            Text("Animation, Gesture Test - 1!").font(Font.custom("Futura", size: 44))
            Text("Animasition ve Gesture istifade ederek nesneleri herekete getire bilerik(Yeni klik olayi olduqdan sonra Animasyonlu sekilde neslere hereket vereceyik").font(.system(size: 22)).foregroundStyle(.secondary)
            Toggle("Elave Secenekler", isOn: $isOn).frame(width: 400)
            
            Group{
                VStack(spacing: 40){
                    Image(systemName: "hammer.fill").font(.system(size: 34))
                    Text("Senin ucun elave secenekler").font(.largeTitle).padding(.leading,40)
                    TextField(text: $extraInfo) {
                        Text("TextField")
                    }.frame(maxHeight: 60).background(RoundedRectangle(cornerRadius: 25.0).stroke(.white,lineWidth: 2)).textFieldStyle(.roundedBorder)
                    Slider(value: $extraEmaund,in: 0...1.0,step: 0.1)
                }
                //.frame(width: 500)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.blue))
                .padding(.top, 20)
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
            .saturation(isOn ? 1 : 0.5)
            .opacity(isOn ? 1 : 0.3)
            .animation(.bouncy(duration: 2),value: isOn)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
