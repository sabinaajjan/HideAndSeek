//
//  ContentView.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var matchManager = MatchManager()
    var body: some View {
        ZStack {
            if matchManager.isGameOver {
                GameOver(matchManager: matchManager)
            } else if matchManager.inGame {
                GameView(matchManager: matchManager)
            } else {
                StartGame(matchManager : matchManager)
            }
          
           
        }
        .onAppear {
                matchManager.authenticateUser()
        }
       
    }
}

#Preview {
    ContentView()
}
