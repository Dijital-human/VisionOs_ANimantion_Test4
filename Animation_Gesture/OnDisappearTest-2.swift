//
//  OnDisappearTest-2.swift
//  Animation_Gesture
//
//  Created by Famil Mustafayev on 19.08.24.
//

import SwiftUI

struct OnDisappearTest_2: View {
    @State private var show: Bool = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0).fill(.white)
            VStack{
                Text("On Disappear Test - 2").foregroundStyle(.black)
                Spacer()
                Image(systemName: show ? "heart" : "heart.fill")
                    .foregroundStyle(show ? .red : .cyan)
                    .padding(30)
                    .background {
                        Circle().stroke(show ? .cyan : .red, lineWidth:show ? 5 : 3)
                        
                    }.opacity(show ? 0.5 : 1)
                    .onTapGesture {
                        show.toggle()
                    }
                if show == false{
                    VStack(alignment:.leading){
                        Text("Informasiya elde etmek isdeyirsinizse buttona click edin")
                        Text("Informasiya elde etmek isdeyirsinizse buttona click edin")
                        Text("Informasiya elde etmek isdeyirsinizse buttona click edinInformasiya elde etmek isdeyirsinizse buttona click edin Informasiya elde etmek isdeyirsinizse buttona click edin Informasiya elde etmek isdeyirsinizse buttona click edin")
                        Text("Informasiya elde etmek isdeyirsinizse buttona click edinInformasiya elde etmek isdeyirsinizse buttona click edin")
                        Text("Informasiya elde etmek isdeyirsinizse buttona click edin")
                        
                        
                        
                    }
                    
                    .padding(40)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .background {
                        RoundedRectangle(cornerRadius: 25.0).fill(.gray)
                    }
                    .padding()
                    .opacity(show ? 0 : 1)
                    .animation(.easeIn(duration: 0.01),value: show)
                }
                if show{
                    VStack(spacing: 20.0){
                        Text("Dijital Human")
                        HStack(spacing: 50.0){
                            Image(systemName: "info.circle").foregroundStyle(.white)
                            Text("Informasiya almaginiz ucun xususi bir yer")
                        }.font(.largeTitle).foregroundStyle(.white)
                        VStack{
                            Text("Dijital Insan programi sizlerin heyatini asanlasdirmaq ucun tasarlandi").font(.headline)
                            Text("Daha genis melumat elde etmeniz ucun asagidaki linke daxil ola bilersiniz").font(.headline).foregroundStyle(.gray)
                                .underline(color: .red)
                        }.padding().background(.white).foregroundStyle(.black)
                        Button(action: {
                            show.toggle()
                        }, label: {
                            Text("Close")
                                .padding()
                                .frame(maxWidth: 300)
                                .background {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .fill(.blue)
                                }
                                .foregroundStyle(.white)
                                .font(.title)
                        })
                        
                        Spacer()
                    }.frame(width: 800, height: 300).background {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(.cyan)
                    }
                }
                Spacer()
            }.font(.extraLargeTitle).foregroundStyle(.black)
        }.animation(.easeInOut(duration: 3), value: show)
    }
}

#Preview {
    OnDisappearTest_2()
}
