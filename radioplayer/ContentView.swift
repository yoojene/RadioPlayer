//
//  ContentView.swift
//  radioplayer
//
//  Created by Eugene on 26/08/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var isPlaying = false
    @State private var player = AVPlayer()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    HStack {
                        Text("Radio 6")
                        Spacer()
                        Button(isPlaying ? "Stop" : "Start"){
                            try? startStopRadio()
                        }
                    }
                    
                }
            }
            .navigationTitle("Radio Streamer")
        }

    }
    
    func startStopRadio() throws {
                
        let url = URL(string: "https://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8")
        guard let unwrapped = url else {
            return //some error
        }
        
        let playerItem = AVPlayerItem(url: unwrapped)
        
        player = AVPlayer(playerItem: playerItem)
        
        if (isPlaying == true) {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
