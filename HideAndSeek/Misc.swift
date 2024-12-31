//
//  Misc.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/30/24.
//

import Foundation

enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center..."
    case unauthenticated = "Please sign into Game Center to play."
    case authenticated = ""
    case error = "There was an error logging into Game Center."
    case restricted = "You're not allowed to play multiplayer games!"
}

let maxTimeRemaining  = 600
