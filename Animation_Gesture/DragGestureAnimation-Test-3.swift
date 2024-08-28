//
//  DragGestureAnimation-Test-3.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct DragGestureAnimation_Test_3: View {
    @GestureState private var showRotate: CGPoint = CGPoint(x: 100, y: 100)
    @State private var location: CGPoint = .zero
    var body: some View {
        ZStack(alignment:.top){
            RoundedRectangle(cornerRadius: 25.0).fill(.black.opacity(0.8))
            VStack{
                Text("Drag Gesture Animation Test - 3")
                Image("img-1")
                    .position(x: showRotate.x + location.x, y: showRotate.y + location.y)
                    .animation(.bouncy(duration: 3), value: UUID())
                
                    .gesture(DragGesture().updating($showRotate, body: { value, state, transaction in
                        state = value.location
                    }).onEnded({ value in
                        location = value.location
                    }))
                
                
            }.foregroundStyle(.white).font(.extraLargeTitle)
        }
    }
}

#Preview {
    DragGestureAnimation_Test_3()
}
