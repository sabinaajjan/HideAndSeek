//
//  MatchManager.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/30/24.
//

import Foundation
import GameKit

class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = PlayerAuthState.authenticating
    @Published var currentlySeeking = true
    @Published var otherLocations = [CGPoint]()
    @Published var ourLocation = CGPoint(x: 1, y: 5)
    @Published var winner = ""
    @Published var remainingTime = maxTimeRemaining
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local
    
    var playerUUIDKey = UUID().uuidString
    
    var rootViewController: UIViewController? {
        let windowScene  = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = {[self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }
            if let error = e {
                authenticationState = .error
                print(error.localizedDescription)
                return
            }
        }
        
        if localPlayer.isAuthenticated {
            if localPlayer.isMultiplayerGamingRestricted {
                authenticationState = .restricted
            } else {
                authenticationState = .unauthenticated
            }
        }
        
    }
    
    
}
