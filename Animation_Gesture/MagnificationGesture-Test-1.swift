//
//  MagnificationGesture-Test-1.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct MagnificationGesture_Test_1: View {
    @GestureState private var scale: CGFloat = 0.0
    @State private var endScale: CGFloat = 1.0
    @GestureState private var showGesture: Bool = true
    @GestureState private var degree: Double = 0.0
    @State private var endDegree: Double = 0.0

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0).fill(.black)
            VStack{
                Text("Magnification Gesture Test - 1").font(.extraLargeTitle)
                Text("Zoom Zoom out and Rotation")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                Spacer()
                Image("img-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .scaleEffect(scale + endScale, anchor: .center)
                    .rotationEffect(.degrees(degree + endDegree),anchor: .bottom)
                    //.animation(.bouncy(duration: 2), value: UUID())
//                    .gesture(MagnifyGesture().updating($scale, body: { value, state, transaction in
//                        state = value.magnification
//                    }).onEnded({ value in
//                        endScale = value.magnification
//                    }))
//                    .gesture(RotateGesture().updating($degree, body: { value, state, transaction in
//                        state = value.rotation.degrees
//                    }).onEnded({ value in
//                        endDegree = value.rotation.degrees
//                    }))
                    .gesture(MagnifyGesture().simultaneously(with: RotateGesture()).onChanged({ value in
                        endScale = value.first?.magnification ?? 1.0
                        endDegree = value.second?.rotation.degrees ?? 0.0
                    })
                    )
                Spacer()
            }
        }
    }
}

#Preview {
    MagnificationGesture_Test_1()
}
