//
//  Perspective.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The `perspective` CSS property determines the distance between the z=0 plane and the user
/// in order to give a 3D-positioned element some perspective.
///
/// This property affects how 3D elements are viewed. The stronger the effect (smaller values),
/// the more dramatic the perspective appears.
///
/// Example:
/// ```css
/// perspective: 800px;
/// perspective: none;
/// ```
public enum Perspective: Property, LengthConvertible, ExpressibleByIntegerLiteral,
  ExpressibleByFloatLiteral, CustomStringConvertible
{
  public static let property: String = "perspective"

  /// No perspective transform is applied
  case none

  /// A length value giving the distance from the user to the z=0 plane
  case length(Length)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none: return "none"
    case .length(let length): return length.description
    case .global(let global): return global.description
    }
  }

  /// Creates a Perspective using an integer literal (interpreted as pixels)
  public init(integerLiteral value: Int) {
    self = .length(.px(Double(value)))
  }

  /// Creates a Perspective using a floating-point literal (interpreted as pixels)
  public init(floatLiteral value: Double) {
    self = .length(.px(value))
  }
}
