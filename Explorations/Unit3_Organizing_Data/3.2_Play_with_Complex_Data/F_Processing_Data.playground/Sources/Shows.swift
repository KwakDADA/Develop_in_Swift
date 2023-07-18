import Foundation

public let showCatalog = [
"Finding Alyssa",
"Last One In",
"Perfectly Imperfect",
"Neptune Abyss",
"Beyond the Night",
"Mason Kemp",
"My One Little Secret",
"Ocean Express",
"100 Stories About One Night",
"Unsure",
"Race to Last Place",
"The Fourth Time",
"Not Now",
"Run Like Kate",
"Up the Road",
"The Ransom Project",
"The Sternwood Five",
"Beneath",
"The Faction",
"Marginalized"
]

public let surveyData1: [String] = ShowsBuilder.messagesFromFile("shows1") ?? ShowsBuilder.showsLiteral
public let surveyData2: [String] = ShowsBuilder.messagesFromFile("shows2") ?? ShowsBuilder.showsLiteral
public let surveyData3: [String] = ShowsBuilder.messagesFromFile("shows3") ?? ShowsBuilder.showsLiteral

public let surveyData = surveyData1

public var randomShowData: [String] = {
    return randomShows(count: 10, capErrorRate: 0, letterErrorRate: 0)
}()

public var randomShowDataLargeSet: [String] = {
    return randomShows(count: 1000, capErrorRate: 0, letterErrorRate: 0)
}()

public var randomShowDataWithErrors: [String] = {
    return randomShows(count: 1000, capErrorRate: 100, letterErrorRate: 300)
}()

let weights = [5, 1, 1, 1, 6, 4, 2, 8, 1, 4, 3, 6, 1, 2, 2, 5, 6, 4, 4, 3]

public func randomShows(count: Int, capErrorRate: Int, letterErrorRate: Int) -> [String] {
    return showCatalog.randomElements(count: count, weights: weights, capErrorRate: capErrorRate, letterErrorRate: letterErrorRate)
}

struct ShowsBuilder {
    static func messagesFromFile(_ name: String) -> [String]? {
        guard let textFileURL = Bundle.main.url(forResource: name, withExtension: "txt") else {
            print("Unable to load resource")
            return nil
        }

        let fullTextString: NSString
        do {
            fullTextString = try NSString(contentsOf: textFileURL, encoding: String.Encoding.utf8.rawValue)
        } catch {
            print("Unable to parse text from \(textFileURL)")
            return nil
        }

        let allLines: [String] = fullTextString.components(separatedBy: .newlines)

        return allLines
    }
        
    static var showsLiteral: [String] = {
        return [
            "100 Stories About One Night","Ocean Express","Run Like Kate","Beyond the Night","Mason Kemp","Race to Last Place","Race to Last Place","Mason Kemp","Ocean Express","Beyond the Night","The Faction","100 Stories About One Night","Ocean Express","Finding Alyssa","The Ransom Project","Ocean Express","The Ransom Project","Unsure","Finding Alyssa","Race to Last Place","The Sternwood Five","Beneath","Unsure","Ocean Express","Unsure","The Sternwood Five","Finding Alyssa","The Ransom Project","Race to Last Place","Ocean Express","Marginalized","Run Like Kate","Ocean Express","The Sternwood Five","Mason Kemp","Ocean Express","The Sternwood Five","Ocean Express","Last One In","Up the Road","Finding Alyssa","The Ransom Project","Race to Last Place","Ocean Express","Unsure","The Sternwood Five","Ocean Express","The Sternwood Five","Not Now","My One Little Secret","Ocean Express","Ocean Express","The Sternwood Five","100 Stories About One Night","Unsure","My One Little Secret","Unsure","Ocean Express","The Faction","Ocean Express","Unsure","Unsure","Beyond the Night","The Ransom Project","The Fourth Time","Ocean Express","Ocean Express","The Sternwood Five","Finding Alyssa","Finding Alyssa","The Faction","Mason Kemp","Ocean Express","Marginalized","Marginalized","Finding Alyssa","Unsure","Beneath","The Sternwood Five","Beneath","Race to Last Place","The Fourth Time","The Ransom Project","Finding Alyssa","Unsure","Finding Alyssa","Finding Alyssa","Beneath","The Ransom Project","Unsure","Beyond the Night","Up the Road","Ocean Express","Ocean Express","Beyond the Night","Ocean Express","Ocean Express","Marginalized","Marginalized","Neptune Abyss","Ocean Express","Beneath","Marginalized","Beneath","The Fourth Time","The Sternwood Five","The Sternwood Five","Beyond the Night","Ocean Express","Ocean Express","Not Now","The Faction","Finding Alyssa","The Sternwood Five","The Fourth Time","The Fourth Time","Ocean Express","The Fourth Time","Beneath","Run Like Kate","Finding Alyssa","Beyond the Night","The Fourth Time","Mason Kemp","Unsure","Mason Kemp","Ocean Express","Ocean Express","Ocean Express","The Sternwood Five","The Fourth Time","The Fourth Time","Ocean Express","Mason Kemp","Ocean Express","Ocean Express","Ocean Express","The Fourth Time","UNsure","Mason Kemp","Finding Alyssa","The Sternwood Five","The Fourth Time","Run Like Kate","Finding Alyssa","Beneath","The Ransom Project","The Sternwood Five","Race to Last Place","The Faction","The Faction","Beyond the Night","100 Stories About One Night","Mason Kemp","Finding Alyssa","100 Stories About One Night","Beyond the Night","Marginalized","Perfectly Imperfect","The Ransom Project","The Sternwood Five","Not Now","The Sternwood Five","Last One In","The Sternwood Five","The Ransom Project","Beyond the Night","Run Like Kate","Marginalized","Ocean Express","Mason Kemp","My One Little Secret","The Faction","Finding Alyssa","Finding Alyssa","Beyond the Night","Ocean Express","The Ransom Project","The Sternwood Five","Up the Road","The Fourth Time","Ocean Express","Finding Alyssa","The Fourth Time","The Sternwood Five","Up the Road","My One Little Secret","The Faction","Marginalized","The Sternwood Five","The Fourth Time","Finding Alyssa","The Faction","Marginalized","Finding Alyssa","Ocean Express","The Faction","The Sternwood Five","Marginalized","Marginalized","Finding Alyssa","Run Like Kate","Unsure","My One Little Secret","Beyond the Night","Unsure","Ocean Express","Finding Alyssa","The Sternwood Five","The Faction","Race to Last Place","My One Little Secret","Ocean Express","Mason Kemp","Ocean Express","Beyond the Night","Unsure","Unsure","Race to Last Place","Beyond the Night","Ocean Express","Run Like Kate","The Faction","The Faction","Race to Last Place","Beyond the Night","Marginalized","Beyond the Night","Ocean Express","Ocean Express","Ocean Express","Finding Alyssa","Marginalized","The Faction","The Ransom Project","The Faction","Mason Kemp","Ocean Express","Mason Kemp","My One Little Secret","The Sternwood Five","Beyond the Night","Neptune Abyss","The Sternwood Five","Ocean Express","The Sternwood Five","The Faction","Mason Kemp","The Ransom Project","Marginalized","Not Now","Beyond the Night","Beneath","Unsure","Beyond the Night","Run Like Kate","The Sternwood Five","The Sternwood Five","The Fourth Time","Mason Kemp","Unsure","Beneath","Finding Alyssa","Up the Road","Beyond the Night","Finding Alyssa","My One Little Secret","The Ransom Project","Not Now","The Fourth Time","Ocean Express","Race to Last Place","The Sternwood Five","Ocean Express","Race to Last Place","Up the Road","Finding Alyssa","Ocean Express","Marginalized","Beyond the Night","Finding Alyssa","Mason Kemp","Mason Kemp","Up the Road","Ocean Express","My One Little Secret","Neptune Abyss","The sternwood Five","Unsure","Ocean Express","Beyond the Night","Marginalized","Finding Alyssa","Up the Road","Beneath","Race to Last Place","Finding Alyssa","The Sternwood Five","Marginalized","Up the Road","Beyond the Night","Ocean Express","Finding Alyssa","Marginalized","My One Little Secret","Marginalized","100 Stories About One Night","Ocean Express","Up the Road","Beyond the Night","Race to Last Place","Marginalized","The Sternwood Five","Up the Road","Ocean Express","The Faction","Ocean Express","Mason Kemp","Race to Last Place","Finding Alyssa","Finding Alyssa","The Faction","Beneath","Race to Last Place","Neptune Abyss","Beyond the Night","The Fourth Time","Last One In","Mason Kemp","The Sternwood Five","Race to Last Place","Ocean Express","Ocean Express","Finding Alyssa","Finding Alyssa","The Fourth Time","The Faction","Finding Alyssa","Beneath","The Fourth Time","Ocean Express","Ocean Express","The Fourth Time","Beyond the Night","Ocean Express","Last One In","Beneath","The Fourth Time","run Like Kate","Ocean Express","Finding Alyssa","Beyond tHe Night","Perfectly Imperfect","The Ransom Project","100 Stories About One Night","Beyond the Night","Ocean Express","The Ransom Project","Beyond the Night","Beyond the Night","Run Like Kate","The Ransom Project","Race to Last Place","My One LIttle Secret","The Fourth Time","Last One In","The Ransom Project","The Sternwood Five","The Ransom Project","Finding Alyssa","Mason Kemp","Ocean Express","Neptune Abyss","The Sternwood Five","Ocean Express","Up the Road","Up the Road","Beyond the Night","Beneath","Ocean Express","Beyond the Night","The Ransom Project","Beyond the Night","Up the Road","Race to Last Place","Beneath","Ocean Express","Unsure","Beyond the Night","The Fourth Time","Beneath","Ocean Express","The Fourth Time","Finding Alyssa","Race to Last Place","Run Like Kate","Mason Kemp","The Fourth Time","The Fourth Time","Beneath","The Fourth Time","Ocean Express","The Ransom Project","Finding Alyssa","Perfectly Imperfect","Race to Last Place","Race to Last Place","Unsure","Neptune Abyss","Mason Kemp","Beyond the Night","Up the Road","The Faction","Beyond the Night","The Faction","Beyond the Night","Beyond the Night","Race to Last Place","The Fourth Time","100 Stories About One Night","The Faction","Finding Alyssa","Neptune Abyss","Marginalized","Unsure","Beyond the Night","The Fourth Time","Mason Kemp","Finding Alyssa","Ocean Express","Ocean Express","Race to Last Place","My One Little Secret","The Sternwood Five","Marginalized","Ocean Express","Beneath","The Sternwood Five","Ocean Express","Beneath","The Sternwood Five","The Fourth Time","Mason Kemp","Ocean Express","Finding Alyssa","Ocean Express","Unsure","Up the Road","Neptune Abyss","The Fourth Time","The Faction","Mason Kemp","The Fourth Time","The Fourth Time","The Fourth Time","The Sternwood Five","The Ransom Project","The Fourth Time","My One Little Secret","The Sternwood Five","Beneath","Ocean Express","Ocean Express","Finding Alyssa","Beyond the Night","Ocean Express","Beyond the Night","The Faction","Beyond the Night","Beyond the Night","The Fourth Time","Finding Alyssa","Benfath","Up the Road","The Ransom Project","The Faction","Unsure","Ocean Express","Perfectly Imperfect","The Sternwood Five","Unsure","Race to Last Place","Not Now","The Sternwood Five","Not Now","The Fourth Time","Beneath","Beyond the Night","Ocean Express","The Faction","Beneath","Beneath","The Fourth Time","Beyond the Night","Perfectly Imperfect","The Sternwood Five","marginalized","Up the Road","Beyond the Night","Beneath","Ocean Express","Finding Alyssa","Finding Alyssa","Perfectly Imperfect","Mason Kemp","Ocean Express","Neptune Abyss","Unsure","The Sternwood Five","Beyond the Night","Ocean Express","The Faction","The Fourth Time","The Faction","Beyond the Night","Race to Last Place","Marginalized","Unsure","The Fourth Time","Finding Alyssa","Finding Alyssa","Perfectly Imperfect","Beneath","Beyond the Night","Unsure","Beneath","Ocean Express","Beyond the Night","Ocean Express","Ocean Express","The Sternwood Five","Beneath","Ocean Express","Beyond the Night","Neptune Abyss","Marginalized","Up the Road","The Fourth Time","Unsure","Ocean Express","Unsure","The Fourth Time","The Sternwood Five","The Faction","Beneath","Up the Road","Run Like Kate","The Ransom Project","Beyond the Night","The Sternwood Five","Finding Alyssa","Ocean Express","Beyond the Night","Beyond the Night","Ocean Express","Marginalized","Ocean Express","Beneath","Ocean Express","The Fourth Time","Finding Alyssa","Up the Road","Beneath","Mason Kemp","Beyond the Night","Beyond the Night","The Sternwood Five","Marginalized","Neptune Abyss","Mason Kemp","Unsure","The Fourth Time","Unsure","Not Now","Finding Alyssa","The Ransom Project","Mason Kemp","The Sternwood Five","Race to Last Place","Beyond the Night","The Sternwood Five","The Faction","Not Now","Mason Kemp","Finding Alyssa","The Faction","Marginalized","Unsure","Up the Road","The Ransom Project","Beneath","The Fourth Time","Race to Last Place","The Ransom Project","Finding Alyssa","Finding alyssa","The Sternwood Five","100 Stories About One Night","Up the Road","The Sternwood Five","Beyond the Night","Neptune Abyss","Finding Alyssa","Finding Alyssa","Up the Road","The Faction","Beneath","Unsure","Mason Kemp","Ocean Express","Perfectly Imperfect","MAson Kemp","Finding Alyssa","The Ransom Project","Run Like Kate","The Fourth Time","Marginalized","Marginalized","Finding Alyssa","Marginalized","The Fourth Time","The Ransom Project","Beyond the Night","Unsure","My One Little Secret","The Sternwood Five","The Sternwood Five","Unsure","Mason Kemp","Beneath","My One Little Secret","Unsure","Ocean Express","Ocean Express","Mason Kemp","Ocean Express","Beyond the Night","Beyond the Night","The Sternwood Five","The Sternwood Five","Marginalized","The Ransom Project","Race to Last Place","The Ransom Project","Ocean Express","The Fourth Time","Beneath","The Faction","Beneath","The Faction","Neptune Abyss","Up the Road","Beneath","Ocean Express","Beyond the Night","My One Little Secret","The Sternwood Five","The Sternwood Five","Beneath","The Fourth Time","The Fourth Time","Last One In","The Faction","Ocean Express","The Faction","Mason Kemp","The Faction","Ocean Express","The Sternwood Five","Mason Kemp","The Ransom Project","Perfectly Imperfect","Ocean Express","My One Little Secret","The Fourth Time","Beyond the Night","The Sternwood Five","Unsure","Last One In","My One Little Secret","Beneath","The Ransom Project","The Faction","The Faction","The Fourth Time","The Sternwood Five","Beyond the Night","Finding Alyssa","The Ransom Project","Beneath","The Faction","Beneath","Up the Road","The Sternwood Five","Neptune Abyss","Ocean Express","Race to Last Place","Run Like Kate","Marginalized","The Sternwood Five","Ocean Express","Ocean Express","Up the Road","Not Now","The Faction","The Fourth Time","The Fourth Time","Race to Last Place","The Fourth Time","Finding Alyssa","Beneath","Last One In","The Fourth Time","100 Stories About One Night","Beyond the Night","Ocean Express","100 Stories About One Night","The Faction","Ocean Express","Beneath","Run Like Kate","Finding Alyssa","Unsure","Run Like Kate","Run Like Kate","Beyond the Night","My One Little Secret","Run Like Kate","The Faction","Up the Road","Ocean Express","Beyond the Night","Up the Road","Ocean Express","Beneath","The Ransom Project","The Sternwood Five","Finding Alyssa","Finding Alyssa","The Faction","The Fourth Time","The Fourth Time","Beyond the Night","Ocean Express","Unsure","Finding Alyssa","The Ransom Project","The Ransom Project","Marginalized","The Faction","Beneath","Beyond the Night","Beneath","Beyond the Night","Run Like Kate","My One Little Secret","Ocean Express","The Faction","Finding Alyssa","Finding Alyssa","The Fourth Time","Neptune Abyss","The Sternwood Five","The Faction","Up the Road","My One Little Secret","Race to Last Place","Beneath","Finding Alyssa","Marginalized","Ocean Express","The Sternwood Five","The Ransom Project","The Sternwood Five","Beneath","Marginalized","Not Now","Beyond the Night","Mason Kemp","Beyond the Night","The Sternwood Five","Last One In","Finding Alyssa","Ocean Express","Mason Kemp","Beyond the Night","Race to Last Place","Finding Alyssa","Ocean Express","The Fourth Time","The Sternwood Five","The Fourth Time","Ocean Express","Mason Kemp","The Sternwood Five","The Sternwood Five","Mason Kemp","The Ransom Project","Unsure","Mason Kemp","Run Like Kate","The Sternwood Five","The Ransom Project","Marginalized","Beyond the Night","Not Now","Marginalized","The Ransom Project","Up the Road","Unsure","Ocean Express","Mason Kemp","Last One In","Marginalized","Mason Kemp","Finding Alyssa","The Fourth Time","Finding Alyssa","The Faction","Ocean Express","The Fourth Time","Up the Road","The Sternwood Five","The Sternwood Five","Mason Kemp","The Faction","Ocean Express","100 Stories About One Night","Unsure","Race to Last Place","Unsure","Neptune Abyss","The Fourth Time","The Faction","The Faction","Mason Kemp","My One Little Secret","My One Little Secret","The Sternwood Five","My One Little Secret","Unsure","Race to Last Place","Not Now","Run Like Kate","The Ransom Project","Marginalized","The Ransom Project","Mason Kemp","The Fourth Time","Neptune Abyss","The Fourth Time","My One Little Secret","The Sternwood Five","Beyond the Night","Beyond the Night","The Fourth Time","Run Like Kate","Finding Alyssa","Beyond the Night","Ocean Express","The Sternwood Five","Finding Alyssa","Ocean Express","Ocean Express","Mason Kemp","Finding Alyssa","Finding Alyssa","The Sternwood Five","Race to Last Place","Beyond the Night","Beyond the Night","Run Like Kate","Neptune Abyss","The Sternwood Five","Mason Kemp","Finding Alyssa","Ocean Express","The Ransom Project","Unsure","Neptune Abyss","Marginalized","Run Like Kate","Ocean Express","Not Now","100 Stories About One Night","Beyond the Night","Up the Road","Beyond the Night","Mason Kemp","The Fourth Time","The Faction","The Sternwood Five","The Fourth Time","THe Sternwood Five","Unsure","The Faction","Unsure","Finding Alyssa","Last One In","The Sternwood Five","Beyond the Night","Unsure","The Faction","The Faction","Unsure","The Fourth Time","Not NOw","The Ransom Project","The Sternwood Five","The Fourth Time","Finding Alyssa","Ocean Express","Ocean Express","The Sternwood Five","Mason Kemp","100 Stories About One Night","The Fourth Time","Beneath","The Fourth Tine","Beneath","Beneath","The Fourth Time","Run Like Kate","The Fourth Time","Up the Road","The Fourth Time","Finding Alyssa","Unsure","Mason Kemp","The Fourth Time","Last One In","The Fourth Time","Mason Kemp","Beyond the Night","The Ransom Project","The Fourth Time","The Sternwood Five","The Ransom Project","Beneath","Finding Alyssa","The Sternwood Five","Marginalized","The Fourth Time","Ocean Express","Not Now","Ocean Express","The Faction","Run Like Kate","Last One In","Finding Alyssa","Neptune Abyss","The Ransom Project","Beneath","The Faction","Neptune Abyss","Finding Alyssa","The Ransom Project","Beyond the Night","Mason Kemp","The Sternwood Five","My One Little Secret","The Faction","Unsure","The Sternwood Five","The Faction","100 Stories About One Night","Beneath","Beyond the Night","Beyond the Night","The Sternwood Five","Beneath","Beneath","Beyond the Night","The Faction","Finding Alyssa","Beyond the Night","The Faction","The Faction","Finding Alyssa","The Sternwood Five","Marginalized","The Sternwood Five","The Fourth Time","Race to Last Place","The Fourth Time","The Faction","Ocean Express","Begond the Night","The Faction","Marginalized","Ocean Express","Neptune Abyss","Mason Kemp","Beyond the Night","Unsure","Finding Alyssa","Finding Alyssa","Ocean Express","Marginalized","The Ransom Project"
        ]
    }()
}
