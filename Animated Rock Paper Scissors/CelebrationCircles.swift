//
//  CelebrationCircles.swift
//  Animated Rock Paper Scissors
//
//  Created by Macintosh HD on 17/08/2021.
//

import SwiftUI

struct CelebrationCircles: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: rect.origin)
        for _ in 0 ..< 18 {
            let barHeight = CGFloat.random(in: 2.5..<7)
            let barRect = CGRect(x: CGFloat.random(in: rect.minX ..< rect.midX), y: CGFloat.random(in: rect.minY ..< rect.midY), width: barHeight, height: barHeight)
            path.addRoundedRect(in: barRect, cornerSize: CGSize(width: barHeight / 2 , height: barHeight / 2 ))
        }
        
        for _ in 0 ..< 18 {
            let barHeight = CGFloat.random(in: 2.5..<7)
            let barRect = CGRect(x: CGFloat.random(in: rect.midX ..< rect.maxX), y: CGFloat.random(in: rect.midY ..< rect.maxY), width: barHeight, height: barHeight)
            path.addRoundedRect(in: barRect, cornerSize: CGSize(width: barHeight / 2 , height: barHeight / 2 ))
        }
        
        return path
    }
    
    }

struct CelebrationCircles_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            CelebrationCircles()
               
                .fill(Color.red)
                .frame(height: 300)
                .padding()
        }
    }
}