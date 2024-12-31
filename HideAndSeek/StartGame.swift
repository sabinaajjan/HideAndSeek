//
//  StartGame.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/17/24.
//

import SwiftUI

struct StartGame: View {
    @ObservedObject var matchManager: MatchManager
    var body: some View {
        VStack{
            Spacer()
            Image("HideAndSeekLogo2")
                .resizable()
                .scaledToFit()
                .padding(30)
            
            Spacer()
            
            Button {
                //TODO: Start Matchmaking Menu
            } label: {
                Text("PLAY")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
            }
            .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background(
                    Capsule(style: .circular).fill(matchManager.authenticationState != .authenticated || matchManager.inGame ? .gray : Color(.orange)))
        }
        Text(matchManager.authenticationState.rawValue)
            .font(.headline.weight(.semibold)).padding()
        
        Spacer()
    }
    }

#Preview {
    StartGame(matchManager: MatchManager())
}
