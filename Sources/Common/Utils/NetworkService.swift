//
//  NetworkService.swift
//  Core
//
//  Created by Deanira Fadrinaldi on 18/11/26.
//

import Alamofire
import Combine
import Foundation

public struct NetworkService {
  private let session: Session
  private let decoder: JSONDecoder

  public init(
    session: Session = .default,
    decoder: JSONDecoder = JSONDecoder()
  ) {
    self.session = session
    self.decoder = decoder
  }

  public func perform<T: Decodable & Sendable>(
    _ api: NetworkModelRequest,
    as type: T.Type
  ) -> AnyPublisher<T, Error> {
    Deferred {
      do {
        let urlRequest = try URLRequestUtils.setupURLRequest(from: api)

        return session.request(urlRequest)
          .cURLDescription { log("➡️ \($0)") }
          .validate()
          .publishDecodable(type: T.self, decoder: decoder)
          .tryMap { response -> T in
            log("⬅️ \(urlRequest.url?.absoluteString ?? "-") [\(response.response?.statusCode ?? 0)]")
            return try response.result.get()
          }
          .eraseToAnyPublisher()
      } catch {
        log("❌ \(error)")
        return Fail<T, Error>(error: error).eraseToAnyPublisher()
      }
    }
    .eraseToAnyPublisher()
  }
}

private func log(_ message: @autoclosure () -> String) {
  #if DEBUG
  print("debug: \(message())")
  #endif
}
