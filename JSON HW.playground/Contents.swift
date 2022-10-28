import Foundation

let blackLotus = "Black Lotus"
let opt = "Opt"
let cardsName = blackLotus

var urlMagicComponents = URLComponents()
urlMagicComponents.scheme = "https"
urlMagicComponents.host = "api.magicthegathering.io"
urlMagicComponents.path = "/v1/cards"
urlMagicComponents.queryItems = [URLQueryItem(name: "name", value: cardsName)]

let magicURL = urlMagicComponents.url

// MARK - Start
GetData.allCards(urlReuaest: magicURL)
