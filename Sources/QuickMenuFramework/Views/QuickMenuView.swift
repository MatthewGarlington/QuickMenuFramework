//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/30/22.
//

import SwiftUI
import ComposableArchitecture

public struct QuickMenuView: View {
    public let store: Store<QuickMenuState, QuickMenuAction>

    public init(store: Store<QuickMenuState, QuickMenuAction>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStore<QuickMenuState, QuickMenuAction>) in
        ZStack {
                Button {
                } label: {
                    ButtonView(name: viewStore.name[0])
                }
                .offset(x: viewStore.state.activate ? -100 : 0, y:  viewStore.state.activate ? 0: 0)
                .opacity(viewStore.state.activate ? 1 : 0)
                
                Button {
                } label: {
                    ButtonView(name: viewStore.name[1])
                }
                .offset(x: 0, y: viewStore.state.activate ? -110 : 0)
                .opacity(viewStore.state.activate ? 1 : 0)
                
                Button {
                    withAnimation {
                        viewStore.send(.showPostEdit)
                    }
                } label: {
                    ButtonView(name: viewStore.name[2])
                }
                .offset(x: viewStore.state.activate ? -75 : 0, y: viewStore.state.activate ? -75 : 0)
                .opacity(viewStore.state.activate ? 1 : 0)
            Button {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.3)) {
                    viewStore.send(.activate)
                }
            } label: {
                ButtonView(name: viewStore.name[3])
            }
            .rotationEffect(Angle(degrees: viewStore.state.activate ? 135 : 0))
        }
        }
    }
}

public struct QuickMenuView_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: QuickMenuState(),
        reducer:  quickMenuReducer,
        environment: .cancelRequest
    )
    public static var previews: some View {
        QuickMenuView(store: mockStore)
    }
}



