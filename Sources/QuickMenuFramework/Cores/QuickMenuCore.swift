//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/30/22.
//

import Foundation
import ComposableArchitecture
import Combine


public struct QuickMenuState: Equatable {
    public var showPostEdit: Bool
    public var activate: Bool
    public var name: [String]
    public init(
        showPostEdit: Bool = false,
        activate: Bool = false,
        name: [String] = ["person", "note", "pencil", "plus"]
    ) {
        self.showPostEdit = showPostEdit
        self.activate = activate
        self.name = name
    }
}

public enum QuickMenuAction: Equatable {
    case activate
    case showPostEdit
}


public typealias QuickMenuEnviroment = NetworkRequestAction<Nothing, NetworkError>


public let quickMenuReducer = Reducer<QuickMenuState, QuickMenuAction, QuickMenuEnviroment> { state, action, env in
    switch action {
    case .activate:
        state.activate.toggle()
        return .none
    case .showPostEdit:
        state.showPostEdit.toggle()
        return .none
    }
}