struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        let lowerQuestion = question.lowercased()
        
        if  lowerQuestion.hasPrefix("hello") {
            return "Why, hello there!"
        } else if lowerQuestion == "where are the cookies?" {
            return "In the cookie jar!"
        } else if lowerQuestion.hasPrefix("where") {
            return "To the North!"
        }
        
        let patternNumber = lowerQuestion.count % 3
        if patternNumber == 2 {
            return "I don't understand"
        } else if patternNumber == 1 {
            return "That really depends"
        } else {
            return "Ask me tomorrow"
        }
    }
}
