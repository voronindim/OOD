//
//  PointView.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 20.11.2020.
//

import SwiftUI

struct PointView: View {
    
    @State private var leftTop: CGPoint!
    @State private var leftButtom: CGPoint!
    @State private var rightBottom: CGPoint!
    @State private var rightTop: CGPoint!
    
    var body: some View {
        RectangleShapeView()
    }
}


