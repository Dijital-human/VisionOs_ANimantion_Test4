//
//  LongPressGesture-Test-1.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct LongPressGesture_Test_1: View {
    @State private var isPresent: Bool = false
    var body: some View {
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(.black.opacity(0.9))
            VStack(spacing: 10.0){
                Text("Long Press Gesture Test - 1")
                Spacer()
                HStack{
                    Circle().fill(.green)
                        .frame(width: 200, height: 200)
                        .overlay {
                            Text("Clicked").font(.largeTitle).bold()
                        }.saturation(0.7)
                        .overlay(content: {
                            Circle().stroke(.red, lineWidth: 3)
                                .scaleEffect(isPresent ? 10 : 1)
                                .opacity(isPresent ? 0.2 : 1)
                        })
                        .animation(.bouncy(duration: 3), value: isPresent)
//                        .onTapGesture {
//                            isPresent.toggle()
//                        }
//                        .onTapGesture(count: 2, perform: {
//                            isPresent.toggle()
//                        })
//                        .onLongPressGesture {
//                            isPresent.toggle()
//                        }
//                        .gesture(LongPressGesture(minimumDuration: 4).onChanged({ _ in
//                            isPresent = true
//                        }).onEnded({ x in
//                            isPresent = false
//                        }))
                    
                    
                    Text("Gesture").frame(width: 200, height: 200)
                        
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(.green, lineWidth: 3)
                                .scaleEffect(isPresent ? 10 : 1)
                        }
                        .animation(.easeInOut(duration: 3), value: UUID())
//                        .onLongPressGesture(minimumDuration: 2) {
//                            isPresent.toggle()
//                        }
                        .gesture(DragGesture().onChanged({ value in
                            isPresent.toggle()
                            
                        }))
                }
                Spacer()
            }.font(Font.custom("Futura", size: 44))
        })
    }
}

#Preview {
    LongPressGesture_Test_1()
}
