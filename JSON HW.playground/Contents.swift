import Foundation

let cardsName = "Black Lotus|Opt"

var urlMagicComponents = URLComponents()
urlMagicComponents.scheme = "https"
urlMagicComponents.host = "api.magicthegathering.io"
urlMagicComponents.path = "/v1/cards"
urlMagicComponents.queryItems = [URLQueryItem(name: "name", value: cardsName)]

let magicURL = urlMagicComponents.url

// MARK - Start
GetData.allCards(urlReuaest: magicURL, cardsName: ["Opt", "Black Lotus"])
