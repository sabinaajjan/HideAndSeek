//
//  MenuView.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 1/1/25.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MenuView(matchManager: MatchManager())
}
