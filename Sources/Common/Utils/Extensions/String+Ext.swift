//
//  String+Ext.swift
//  Common
//
//  Created by Deanira Fadrinaldi on 22/11/26.
//

import Foundation

extension String {
  func localized() -> String {
    Bundle.module.localizedString(forKey: self, value: nil, table: nil)
  }

  public func commonLocalized(_ bundle: Bundle) -> String {
    bundle.localizedString(forKey: self, value: nil, table: nil)
  }
}
