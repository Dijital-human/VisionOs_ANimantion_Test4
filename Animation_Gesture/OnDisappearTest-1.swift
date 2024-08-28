//
//  OnDisappearTest-1.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct OnDisappearTest_1: View {
    @State private var show: Bool = true
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
            
            VStack{
                Text("OnDisappear Test - 1")
                Spacer()
                if show == false{
                    HStack{
                        Image(systemName: "info.circle").foregroundStyle(.blue)
                            .padding()
                            .onTapGesture {
                                show = true
                            }
                        Spacer()
                    }
                }
                if show{
                    VStack(spacing: 0){
                        HStack{
                            Image(systemName: "info.circle")
                                .padding(.leading, 30)
                            Spacer()
                            Text("Informasiya")
                            Spacer()
                        }
                        
                        .background{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(.green)
                        }
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        VStack{
                            Text("About the dijital human ir is beatiful programing")
                            Button(action: {
                                show.toggle()
                            }, label: {
                                Text("Close").font(.title).frame(maxWidth: .infinity)
                                    .padding().background(RoundedRectangle(cornerRadius: 25.0).fill(.blue)).foregroundStyle(.white)
                            })
                        }
                        .padding(30)
                        .background(RoundedRectangle(cornerRadius: 25.0)
                        .fill(.cyan))
                        .padding()
                        .onDisappear(perform: {
                            show = false
                        })
                    }.background{
                        RoundedRectangle(cornerRadius: 25.0).fill(.yellow)
                    }.padding()
                    
                }
                
            }.font(.extraLargeTitle).foregroundStyle(.black)
        }.animation(.default,value: show)
    }
}

#Preview {
    OnDisappearTest_1()
}
