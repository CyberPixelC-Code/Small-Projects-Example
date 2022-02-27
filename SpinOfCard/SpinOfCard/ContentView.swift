//
//  ContentView.swift
//  SpinOfCard
//
//  Created by Josh Steadman on 21/02/2022.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var card = "backCard"
    @State var num:Double = 0
    @State var face = false
    @State var width:CGFloat = 240 / 2
    @State var height:CGFloat = 336 / 2
    @State var shadow:CGFloat = 0
    
    var body: some View {
        ZStack{
            Image(card)
                .resizable()
                .frame(width: width, height: height)
                .border(Color.black, width: 2)
                .rotation3DEffect(.degrees(num), axis: (x:0, y:1, z:0))
                .shadow(color: Color.gray, radius: shadow, x: 0, y: 0)
                .onTapGesture {
                    face.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                        withAnimation(.easeIn(duration: 0.1)){
                            num = 90
                            if face == true{
                                width = 240
                                height = 336
                            }
                            else{
                                width = width / 2
                                height = height / 2
                            }
                        }
                    })//End of queue
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                        if face == true{
                            card = "frontCard"
                        }
                        else{
                            card = "backCard"
                        }
                        withAnimation(.easeOut(duration: 0.1)){
                            num = 180
                            if face == true{
                                shadow = 20
                            }
                            else{
                                shadow = 0
                            }
                        }
                        num = 0
                    })//End of queue
                }//End of tap
            
        }//End of Stack
    }//End of view
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
