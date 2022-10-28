import Foundation

public struct GetData {
    public static func allCards(urlReuaest: URL?) {
        guard let url = urlReuaest else { return }
        URLSession.shared.jsonDecodableTask(with: url) { (result: Result<Cards, Error>) in
            switch result {
            case .success(let cards):
                cards.printAllCards()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
