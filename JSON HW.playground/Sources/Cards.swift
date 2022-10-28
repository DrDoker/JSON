import Foundation

public struct Cards: Codable {
    let cards: [Card]

    public func printAllCards() {
        cards.forEach { card in
            card.printCard()
        }
    }
}

struct Card: Codable {
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
