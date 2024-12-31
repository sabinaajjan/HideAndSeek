//
//  MatchManager.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/30/24.
//

import Foundation

class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = PlayerAuthState.authenticating
    @Published var currentlySeeking = false
    @Published var otherLocations = [CGPoint]()
    @Published var ourLocation = CGPoint(x: 1, y: 5)
    @Published var winner = ""
    @Published var remainingTime = maxTimeRemaining
    
}
