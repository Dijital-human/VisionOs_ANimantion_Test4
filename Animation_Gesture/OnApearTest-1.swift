//
//  OnApearTest-1.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct OnApearTest_1: View {
    @State private var show: Bool = false
    @State private var sizeValue: CGFloat = 2.0
    
    var body: some View {
        ZStack(alignment: .center, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(.cyan)
            Image(systemName: "heart.fill")
                .shadow(color: .white, radius: 3, x: -10.0)
                .shadow(color: .white, radius: 3, x: 10.0)

                .font(.system(size: 150))
                .foregroundStyle(.red)
                .padding(30)
                .background(Circle().stroke(show ? .cyan.opacity(show ? 1 : 0.4) : .white, lineWidth: show ? 1500 : 3))
                .animation(.easeInOut(duration: 3), value: show)
//                .onTapGesture {
//                    show.toggle()
//
//                }
                .onAppear() {
                    show.toggle()
                }
            ///
            VStack(spacing: 20.0){
                Text("On Apear Test - 1").font(.system(size: show ? 64 : 42))
                    .foregroundStyle(.white)
                    .animation(.bouncy(duration: 3), value: show)

                Spacer()
                
               
            }
            .font(Font.custom("Futura", size: 44))
            
        })
    }
}

#Preview {
    OnApearTest_1()
}
