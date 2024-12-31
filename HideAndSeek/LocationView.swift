//
//  LocationView.swift
//  HideAndSeek
//
//  Created by Sabina AJJAN on 12/30/24.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var matchManager: MatchManager
    @State private var seekerPosition = CGPoint(x: 50, y: 50)
    @State private var hiderPosition = CGPoint(x: 200, y: 200)
    @State private var normalizedDistance: CGFloat = 1.0
    @State private var backgroundColor: Color = .clear
    let maxDistance: CGFloat = 300.0 //in feet
    private func updateProximityColor(normalizedDistance: CGFloat) {
        let redValue = 1.0 - normalizedDistance
        backgroundColor = Color(red: redValue, green: 0.0, blue: 0.0)
    }
    var body : some View {
        ZStack {
                   // Dynamic background
                   backgroundColor
                       .edgesIgnoringSafeArea(.all)

                   // Debugging info
                   VStack {
                       Text("Seeker Position: \(Int(seekerPosition.x)), \(Int(seekerPosition.y))")
                       Text("Hider Position: \(Int(hiderPosition.x)), \(Int(hiderPosition.y))")
                   }
                   .foregroundColor(.black)
               }
               .onAppear {
                   startGameLoop()
               }
        
    }
    
    private func calculateDistance(from seekerPosition: CGPoint, to hiderPosition: CGPoint) -> CGFloat {
            let dx = seekerPosition.x - hiderPosition.x
            let dy = seekerPosition.y - hiderPosition.y
            return sqrt(dx * dx + dy * dy)
        }

    private func normalizeDistance(_ distance: CGFloat, maxDistance: CGFloat) -> CGFloat {
        return min(max(distance / maxDistance, 0), 1)
    }

    private func updateNormalizedDistance() {
        let distance = calculateDistance(from: seekerPosition, to: hiderPosition)
        normalizedDistance = normalizeDistance(distance, maxDistance: maxDistance)
    }
    
    private func startGameLoop() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
               seekerPosition.x = CGFloat.random(in: -150...150)
               seekerPosition.y = CGFloat.random(in: -150...150)
               hiderPosition.x = CGFloat.random(in: -150...150)
               hiderPosition.y = CGFloat.random(in: -150...150)
               updateNormalizedDistance()
               updateProximityColor(normalizedDistance: normalizedDistance)

               
           }
        
       }
}

#Preview {
    LocationView(matchManager: MatchManager())
}



