//
//  GameView.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/30/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    
    @State var location = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GameView(matchManager: MatchManager())
}
