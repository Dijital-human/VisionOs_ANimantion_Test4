//
//  DragGestureAnimation-Test-2.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct DragGestureAnimation_Test_2: View {
    @GestureState private var imgSize: CGSize = .zero
    @State private var sizeImg: CGPoint = CGPoint(x: 0, y: 0)
    
    @State var x = ""
    var body: some View {
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(.black.opacity(0.8))
            VStack(spacing: 10.0){
                Text("Drag Gesture Animation Test - 2")
                Text("DragGesture ile biz nesneleri hereket etdire bilirik")
                    .font(.system(size: 32))
                    .foregroundStyle(.secondary)
                Text("\(Int(imgSize.width)) . \(Int(imgSize.height))")
                Text(x)
                Image("img-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imgSize.width + 200, height: imgSize.height + 200)
                    .offset(x: sizeImg.x, y: sizeImg.y)
                    .padding()
                    .border(Color.white)
                    .animation(.bouncy(duration: 1), value: UUID())
                    .gesture(DragGesture().updating($imgSize, body: { value, state, transaction in
                        state = value.translation
                        
                    }).onEnded({ value in
                        x = "\(Int(value.translation.width)) . \(Int(value.translation.height))"
                    })
                    )
                
                
            }.font(Font.custom("Futura", size: 44))
        })
    }
}

#Preview {
    DragGestureAnimation_Test_2()
}
