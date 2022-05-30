//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/30/22.
//

import SwiftUI
import ComposableArchitecture


public struct ButtonView: View {
    public var name: String 
    public var body: some View {
            ZStack {
                Circle()
                    .fill(.black.opacity(0.8))
                    .frame(width: 75, height: 75)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
                    .frame(width: 70, height: 70)
                Image(systemName: name)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
        }
    }
}
