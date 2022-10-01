//
//  ContentView.swift
//  RotatingScrollViewPractice
//
//  Created by Berkay Disli on 1.10.2022.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.green, .blue, .red, .orange, .pink, .yellow, .purple]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(1...21, id:\.self) { item in
                            GeometryReader { geometry in
                                VStack {
                                    Text(String(item))
                                        .font(.system(size: 120))
                                        .fontWeight(.black)
                                        .foregroundColor(.black.opacity(0.65))
                                }
                                .frame(width: 300, height: 400)
                                .background(colors[item % 7].gradient)
                                .cornerRadius(10)
                                .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 10), axis: (x: 1, y: 0, z: 0))
                                .id(item)
                            }
                            .frame(width: 300, height: 400)
                            .padding(.vertical)
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Rotating ScrollView")
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.height / 2
        let currentY = geo.frame(in: .global).midY
        return Double(1 - (currentY / maxDistance))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
