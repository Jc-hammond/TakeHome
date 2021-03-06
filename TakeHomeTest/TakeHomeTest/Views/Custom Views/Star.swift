//
//  Star.swift
//  TakeHomeTest
//
//  Created by Connor Hammond on 11/17/21.
//

import SwiftUI

struct Star: Shape {
    
    let corners: Int
    let smoothness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        guard corners >= 2 else { return Path() }
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        var currentAngle = -CGFloat.pi / 2
        
        let angleAdjustment = .pi * 2 / CGFloat(corners * 2)
        
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness
        
        var path = Path()
        
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))
        
        var bottomEdge: CGFloat = 0
        
        for corner in 0..<corners * 2 {
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: CGFloat
            
            if corner.isMultiple(of: 2) {
                bottom = center.y * sinAngle
                
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                
                bottom = innerY * sinAngle
                
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
             currentAngle += angleAdjustment
        }
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2
        
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

struct StarView: View {
    var body: some View {
        Star(corners: 5, smoothness: 0.55)
            .fill(Color.white)
            .frame(width: 165, height: 165)
            .background(Color.blue)
    }
}

struct Star_Previews: PreviewProvider {
    static var previews: some View {
        Star(corners: 5, smoothness: 0.55)
    }
}
