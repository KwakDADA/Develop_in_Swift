//
//  GameState.swift
//  RPS
//
//  Created by 곽다은 on 2023/08/17.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    func message() -> String {
        switch self {
        case .start: return "Rock, Paper, Scissors?"
        case .win: return "You Win!"
        case .lose: return "You Lose."
        case .draw: return "Draw"
        }
    }
}

