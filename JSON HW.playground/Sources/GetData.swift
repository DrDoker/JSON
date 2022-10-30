import Foundation

public struct GetData {
    public static func allCards(urlReuaest: URL?, cardsName: [String]) {
        guard let url = urlReuaest else { return }
        URLSession.shared.jsonDecodableTask(with: url) { (result: Result<Cards, Error>) in
            switch result {
            case .success(var cards):
                cards.printAllCards(cardsName)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
