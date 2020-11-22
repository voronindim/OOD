//
//  ShapeView.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 11.11.2020.
//

import SwiftUI

struct ShapeView: View {
    @State var rectangleOffset: CGSize = .zero
    
    var figure = TriangleShapeView()
        
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.rectangleOffset = value.translation
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.figure
                .offset(rectangleOffset)
                .frame(width: 200, height: 100, alignment: .center)
                .gesture(drag)
                .border(Color.red, width: 3)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShapeView()
                
                
        }
    }
}


struct TriangleShapeView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct RectangleShapeView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minX))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                
        return path
    }
}

struct CircleShapeView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - rect.minX, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        return path
    }
}
