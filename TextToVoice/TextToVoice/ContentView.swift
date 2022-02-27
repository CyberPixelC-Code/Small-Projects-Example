//
//  ContentView.swift
//  TextToVoice
//
//  Created by Josh Steadman on 26/01/2022.
//

import SwiftUI
import AVFoundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.homeDirectoryForCurrentUser
    return paths
}

struct ContentView: View {
    
    @State private var Text2Voice = "Hello"
    @State private var Label = "Hello"
    
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text(Label)
                TextEditor(text: $Text2Voice)
                    .foregroundColor(.secondary)
                    .padding()
                
                Button(action:{
                    let utterance = AVSpeechUtterance(string: Text2Voice)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                    utterance.rate = 3

                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                    
                }){
                    Text("To Speech")
                }
                .buttonStyle(DefaultButtonStyle())
                .padding()
                
            }
            
        }//End of ZStack
    }//End of View
}

struct DefaultButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.black)
            .cornerRadius(8)
            .cornerRadius(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
