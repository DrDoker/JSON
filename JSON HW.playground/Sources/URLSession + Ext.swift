import Foundation

public extension URLSession {

    func jsonDecodableTask<T: Decodable>(with url: URLRequest, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
        self.dataTask(with: url) { (data, response, error) in

            if let error = error {
                completion(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse {
                print("Server response code: \(response.statusCode)")
            }

            guard let data = data else {
                if let error = URLError.dataNotAllowed as? Error {
                    completion(.failure(error))
                }
                return
            }

            do {
                let decoded = try decoder.decode(T.self, from: data)
                completion(.success(decoded))
            } catch  {
                completion(.failure(error))
            }
        }
    }

    func jsonDecodableTask<T: Decodable>(with url: URL, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
       self.jsonDecodableTask(with: URLRequest(url: url), decoder: decoder, completion: completion)
    }
}

