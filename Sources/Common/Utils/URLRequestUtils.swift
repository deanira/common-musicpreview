//
//  URLRequestUtils.swift
//  MusicPreview
//
//  Created by Deanira Fadrinaldi on 01/11/26.
//

import Alamofire
import Foundation

public struct URLRequestUtils {
  public static func setupURLRequest(from modelRequest: NetworkModelRequest) throws -> URLRequest {
    let url = try modelRequest.baseURL.asURL().appendingPathComponent(modelRequest.path)

    var request = try URLRequest(url: url, method: modelRequest.method)
    request.headers = HTTPHeaders(modelRequest.headers)

    guard let parameters = modelRequest.parameters,
          let encoder = encoder(for: modelRequest.method)
    else { return request }

    return try encoder.encode(parameters, into: request)
  }

  private static func encoder(for method: HTTPMethod) -> ParameterEncoder? {
    switch method {
    case .get, .delete:
      return URLEncodedFormParameterEncoder.default
    case .post, .put:
      return JSONParameterEncoder.default
    default:
      return nil
    }
  }
}
