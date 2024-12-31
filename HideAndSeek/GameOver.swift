//
//  GameOver.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/30/24.
//

import SwiftUI


struct GameOver: View {
    @ObservedObject var matchManager: MatchManager
    var body: some View {
        VStack{
            Spacer()
            Image("GameOver")
                .resizable()
                .scaledToFit()
                .padding(30)
            
            Text("Winner:  \(matchManager.winner)").font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
            
            Spacer()
            
            Button {
                //TODO: Go back to menu
            } label: {
                Text("MENU")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
            }
                .padding(.vertical, 10)
                .padding(.horizontal, 50)
                .background(
                    Capsule(style: .circular).fill(.blue)).brightness(0.1)
        }
        
        Spacer()
    }
    }

#Preview {
    GameOver(matchManager: MatchManager())
}
