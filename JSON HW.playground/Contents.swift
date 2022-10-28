import UIKit

let blackLotus = "Black Lotus"
let opt = "Opt"
let cardsName = blackLotus

var urlMagicComponents = URLComponents()
urlMagicComponents.scheme = "https"
urlMagicComponents.host = "api.magicthegathering.io"
urlMagicComponents.path = "/v1/cards"
urlMagicComponents.queryItems = [
   URLQueryItem(name: "name", value: cardsName)
]

let magicURL = urlMagicComponents.url

func getData(urlReuaest: URL?) {
    guard let url = urlReuaest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            let errorString = error?.localizedDescription ?? ""
            print("Error: \(errorString)")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("Server response code: \(response.statusCode)")
            guard let data = data else { return }
            parseCard(json: data)
        } else if let response = response as? HTTPURLResponse {
            print("Server response code: \(response.statusCode)")
        }
    }.resume()
}

func parseCard(json: Data) {
    let decoder = JSONDecoder()

    if let jsonCards = try? decoder.decode(Cards.self, from: json) {
        let cards = jsonCards.cards
        cards.forEach { card in
            card.printCard()
        }
    }
}

// MARK: - Model
struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String
    let type: String
    let setName: String
    let artist: String
    let imageUrl: String?

    public func printCard() {
        print("\nName: \(name)")
        print("Type: \(type)")
        print("Set Name: \(setName)")
        print("Artist: \(artist)")
        print("ImageURL: \(imageUrl ?? "no image")")

    }
}

// MARK - Start
getData(urlReuaest: magicURL)
