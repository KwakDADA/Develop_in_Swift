import UIKit

let searchKeyword = [
    "term": "Catfish+and+the+bottlemen",
    "media": "music"
]

let baseURL = "https://itunes.apple.com/search"

var urlComponents = URLComponents(string: baseURL)!
urlComponents.queryItems = searchKeyword.map{ URLQueryItem(name: $0.key, value: $0.value) }

Task {
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200,
       let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}
