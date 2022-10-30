import Foundation

struct Cards: Decodable {
    var cards: [Card]
    
    mutating func printAllCards(_ cardsName: [String]) {
        filterCards(cardsName)
        cards.forEach { card in
            card.printCard()
        }
    }

    mutating func filterCards(_ cardsName: [String]) {
        cards = cards.filter { card in
            cardsName.contains(card.name)
        }
    }
}

struct Card: Decodable {
    let name: String
    let type: String
    let setName: String
    let artist: String
    let imageUrl: String?
    
    func printCard() {
        print("\nName: \(name)")
        print("Type: \(type)")
        print("Set Name: \(setName)")
        print("Artist: \(artist)")
        print("ImageURL: \(imageUrl ?? "no image")")
    }
}
