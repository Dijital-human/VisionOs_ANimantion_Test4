//
//  DragGestureAnimation_-est-1.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct DragGestureAnimation__est_1: View {
    @GestureState private var menuOffset: CGSize = .zero
    @State private var currentMenuY: CGFloat = 480.0
    var body: some View {
        ZStack(alignment:.top){
            RoundedRectangle(cornerRadius: 25.0).fill(.white)
            VStack(spacing: 10.0){
                Text("Drag Gesture Animation Test -1")
                Text("\(Int(currentMenuY))")
                Spacer()
                VStack{
                    Circle()
                        .fill(.green)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(systemName: "line.horizontal.3")
                                .foregroundStyle(.white)
                                .offset(y: -20)//image yuxari qalxmalidi
                        }
                        .offset(y: -50)//daireni yuxari qaldirmaliyiq

                    HStack{
                        Spacer()
                    }.frame(maxHeight: .infinity)
                    //Spacer()
                    
                }
                .background(RoundedRectangle(cornerRadius: 25.0).fill(.green))
                .offset(x: 0, y: currentMenuY + menuOffset.height)
                .animation(.bouncy(duration: 1),value: UUID())
                .gesture(
                        DragGesture()
                        .updating($menuOffset, body: { value, state, transaction in
                            state = value.translation
                            currentMenuY = value.translation.height
                        }).onEnded({ value in
                            //currentMenuY = value.location.y
                            if value.location.y > 400 || value.location.y < 0 {
                                currentMenuY = 480
                            }else{
                                currentMenuY = value.location.y
                            }
                        })
                    )
            }
            .font(Font.custom("Futura", size: 44))
            .foregroundStyle(.black.opacity(0.6))
            .padding(.top)
        }
    }
}

#Preview {
    DragGestureAnimation__est_1()
}
