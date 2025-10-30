//
//  OverscrollBehavior.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The `overscroll-behavior` CSS property sets what a browser does when reaching
/// the boundary of a scrolling area.
///
/// This property allows controlling scroll chaining behavior (where scrolling propagates
/// to parent elements when a scrollable element's boundaries are reached) and overscroll
/// effects like bounce effects or refresh gestures.
///
/// Example:
/// ```css
/// overscroll-behavior: contain;
/// overscroll-behavior: auto none; /* Different behavior for x and y directions */
/// ```
public enum OverscrollBehavior: Property {
  public static let property: String = "overscroll-behavior"

  /// A single value applied to both x and y directions
  case single(Value)

  /// Different values for horizontal (x) and vertical (y) directions
  case horizontal_vertical(Value, Value)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  /// Overscroll behavior values
  public enum Value: String, Sendable, Hashable {
    /// The default scroll overflow behavior occurs as normal
    case auto

    /// Default scroll overflow behavior is observed inside the element, but no scroll
    /// chaining occurs to neighboring scrolling areas
    case contain

    /// No scroll chaining occurs and default scroll overflow behavior is prevented
    case none
  }

  public var description: String {
    switch self {
    case .single(let value):
      return value.rawValue
    case .horizontal_vertical(let x, let y):
      return "\(x.rawValue) \(y.rawValue)"
    case .global(let global):
      return global.description
    }
  }
}
