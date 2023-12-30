//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by 곽다은 on 12/30/23.
//

import Foundation

struct Athlete: CustomStringConvertible {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
