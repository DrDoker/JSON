import UIKit

let cardsName = "Black Lotus"

var urlMagicComponents = URLComponents()
urlMagicComponents.scheme = "https"
urlMagicComponents.host = "api.magicthegathering.io"
urlMagicComponents.path = "/v1/cards"
urlMagicComponents.queryItems = [
   URLQueryItem(name: "name", value: cardsName)
]

let urlString = urlMagicComponents.url?.absoluteString ?? ""

func getData(urlReuaest: String) {
    let urlReuaest = URL(string: urlReuaest)
    guard let url = urlReuaest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            let errorString = error?.localizedDescription ?? ""
            print("Error: \(errorString)")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let data = data else { return }
            guard let dataAsString = String(data: data, encoding: .utf8) else { return }
            print("Server response code: \(response.statusCode)")
            print("Data from the server: \(dataAsString)")
        } else if let response = response as? HTTPURLResponse {
            print("Server response code: \(response.statusCode)")
        }
    }.resume()
}

getData(urlReuaest: urlString)
