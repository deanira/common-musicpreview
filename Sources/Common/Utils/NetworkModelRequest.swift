//
//  APICall.swift
//  MusicPreview
//
//  Created by Deanira Fadrinaldi on 01/11/26.
//

import Alamofire

public protocol NetworkModelRequest {
  var baseURL: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var headers: [String: String] { get }
  var parameters: (any Codable & Sendable)? { get }
}

public extension NetworkModelRequest {
  var method: HTTPMethod { .get }
  var headers: [String: String] { [:] }
}
