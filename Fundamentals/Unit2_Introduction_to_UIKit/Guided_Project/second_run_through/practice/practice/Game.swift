//
//  Game.swift
//  practice
//
//  Created by 곽다은 on 11/8/23.
//

import Foundation

struct Game {
    var life: Int
    var word: String
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            life -= 1
        }
    }
}
