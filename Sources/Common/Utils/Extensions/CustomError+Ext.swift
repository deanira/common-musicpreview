//
//  CustomError+Ext.swift
//  TheMealsApp
//
//  Created by Gilang Ramadhan on 22/11/22.
//

import Foundation

public enum URLError: LocalizedError {

  case invalidResponse
  case addressUnreachable(URL)

  public var errorDescription: String? {
    switch self {
    case .invalidResponse: return "common_invalid_response_desc".localized()
    case .addressUnreachable(let url): return String(format: "common_address_unreachable_desc".localized(), url.absoluteString)
    }
  }

}

public enum DatabaseError: LocalizedError {

  case invalidInstance
  case requestFailed

  public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "common_invalid_instance_desc".localized()
    case .requestFailed: return "common_request_failed_desc".localized()
    }
  }

}
