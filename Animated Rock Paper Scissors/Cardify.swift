//
//  Cardify.swift
//  Animated Rock Paper Scissors
//
//  Created by Macintosh HD on 17/08/2021.
//



import SwiftUI

struct Cardify : AnimatableModifier {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    
        var animatableData : Double {
        get { rotation }
        set { rotation = newValue }
        }
    
    
    var rotation : Double
    
    func body(content: Content) -> some View {
        
        ZStack{
            let Shape : RoundedRectangle = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                Shape.fill(
                    Color.cyan
                      
                )
                Shape.stroke(lineWidth: DrawingConstants.lineWidth)
                    .foregroundColor(.white)
            } else {
                Shape.fill()
                    .foregroundColor(.cyan)
                
            }
            
            content
                .opacity(rotation < 90 ? 1 : 0)
            
            
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
        
        
        
       
        
        
    }
    
    
    private struct DrawingConstants {
        static let cornerRadius:CGFloat = 20
        static let lineWidth: CGFloat = 3
        
        
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}




















