import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLines([
                CGPoint(x: rect.maxX, y: rect.maxY),
                CGPoint(x: rect.minX, y: rect.maxY),
                CGPoint(x: rect.midX, y: rect.minY)
            ])
        }
    }
}
