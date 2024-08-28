//
//  MagnificationGesture-Test-2.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct MagnificationGesture_Test_2: View {
    @GestureState private var scale:CGFloat = 0.0
    @State private var endScale: CGFloat = 1.0
    var body: some View {
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(.black)
            VStack{
                Text("Magnification Gesture Test - 2").font(.extraLargeTitle).bold()
                Rectangle()
                    .frame(height: 2)
                    .background(.green)
                    .padding(.horizontal)
                
                Text("Zoom in and Zoom Out")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .bold()
                    .monospaced()
                
                HStack{
                    Image("img-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        .scaleEffect(scale + endScale)
                        .rotationEffect(.degrees(<#T##degrees: Double##Double#>))
                        .offset(x: scale + endScale)
                        .animation(.default, value: UUID())
                        .gesture(MagnifyGesture().sequenced(before: RotateGesture()).updating($scale, body: { value, state, transaction in
                            switch value{
                            case .first(let mValue): state = mValue.magnification
                                
                            case .second(let rValue, let mValue):
                                state = CGFloat(mValue?.rotation.degrees ?? 0.0)
                            }
                        }))
                }
            }
        })
    }
}

#Preview {
    MagnificationGesture_Test_2()
}
