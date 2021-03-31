//
//  HTTP.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation

enum HTTP {
    case get
    case post

    func request(url: URL?,
                 header: [String: String] = ["Content-Type": "application/json"],
                 body: [String: Any] = [:],
                 completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = { data, response, error in }) {

        guard let url = url else {
            completion(nil, nil, "Erro! URL Invalida")
            return
        }

        switch self {
        case .get:
            var urlRequest = URLRequest(url: url)
            urlRequest.allHTTPHeaderFields = header
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()

        case .post:
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = header
            guard let data = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            else { return }
            urlRequest.httpBody = data

            URLSession.shared.uploadTask(with: urlRequest, from: data) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()

        }
    }
}
