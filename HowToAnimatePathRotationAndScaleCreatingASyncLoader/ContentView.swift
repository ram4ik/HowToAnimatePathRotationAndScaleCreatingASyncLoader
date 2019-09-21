//
//  ContentView.swift
//  HowToAnimatePathRotationAndScaleCreatingASyncLoader
//
//  Created by ramil on 21/09/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var rotateBlueCircle = false
    @State var scaleUpGreenCircle = false
    @State var drawCheckMark = false
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 1/20, to: 1)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 124, height: 124)
                .rotationEffect(.degrees(rotateBlueCircle ? 0 : -1440), anchor: .center)
                .animation(Animation.easeIn(duration: 4))
                .onAppear() {
                    self.rotateBlueCircle.toggle()
            }
            Circle()
                .frame(width: 124, height: 124)
                .foregroundColor(.green)
                .scaleEffect(scaleUpGreenCircle ? 1 : 0, anchor: .center)
                .animation(Animation.easeInOut(duration: 4))
                .onAppear() {
                    self.scaleUpGreenCircle.toggle()
            }
            
            Path { path in
                path.addLines([
                    .init(x: 70, y: 100),
                    .init(x: 80, y: 110),
                    .init(x: 100, y: 90)
                ])
                
            }
                .trim(from: 0, to: drawCheckMark ? 1 : 0)
                .scale(2, anchor: .topLeading)
                .stroke(Color.white, lineWidth: 10)
                .animation(Animation.easeOut(duration: 0.4).delay(4.0))
                .offset(x: 35, y: 210)
                .onAppear() {
                    self.drawCheckMark.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
