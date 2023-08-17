//
//  Sign.swift
//  RPS
//
//  Created by 곽다은 on 2023/08/17.
//

import Foundation

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "🤚"
        case .scissors: return "✌️"
        }
    }
    
    func defeat(opponent opp: Sign) -> GameState {
        switch (self, opp) {
        case (.rock, .rock): return .draw
        case (.rock, .paper): return .lose
        case (.rock, .scissors): return .win
            
        case (.paper, .rock): return .win
        case (.paper, .paper): return .draw
        case (.paper, .scissors): return .lose
            
        case (.scissors, .rock): return .lose
        case (.scissors, .paper): return .win
        case (.scissors, .scissors): return .draw
        }
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
