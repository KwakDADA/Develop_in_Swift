//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by 곽다은 on 1/3/24.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static var archiveURL = documentDirectory.appending(path: "emojis").appendingPathExtension("plist")
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmojis = try? propertyListEncoder.encode(emojis)
        try? encodedEmojis?.write(to: Emoji.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji] {
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedEmojisData = try? Data(contentsOf: Emoji.archiveURL),
              let decodedEmojis = try? propertyListDecoder.decode(Array<Emoji>.self, from: retrievedEmojisData) else { return [] }
        
        return decodedEmojis
    }
    
    static func sampleEmojis() -> [Emoji] {
        return [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
            Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")]
    }
}
