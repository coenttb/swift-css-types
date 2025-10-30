//
//  Scale.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The `scale` CSS property allows you to specify scale transforms individually and independently
/// of the transform property.
///
/// This maps better to typical user interface usage, and saves having to remember the exact
/// order of transform functions to specify in the transform value.
///
/// Example:
/// ```css
/// scale: 1.5;         /* Scale equally in all dimensions */
/// scale: 1.7 0.5;     /* Scale differently in X and Y */
/// scale: 1.2 1.2 2;   /* 3D scaling (X, Y, Z) */
/// ```
public enum Scale: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral,
  CustomStringConvertible
{
  public static let property: String = "scale"

  /// No scaling should be applied
  case none

  /// A single value that specifies a scale factor for both X and Y axes
  case single(Double)

  /// Two values that specify the X and Y scaling values respectively
  case xy(Double, Double)

  /// Three values that specify the X, Y, and Z scaling values respectively
  case xyz(Double, Double, Double)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  /// Creates a Scale using an integer literal
  public init(integerLiteral value: Int) {
    self = .single(Double(value))
  }

  /// Creates a Scale using a floating-point literal
  public init(floatLiteral value: Double) {
    self = .single(value)
  }

  public var description: String {
    switch self {
    case .none: return "none"
    case .single(let value):
      return value.truncatingRemainder()
    case .xy(let x, let y):
      return "\(x.truncatingRemainder()) \(y.truncatingRemainder())"
    case .xyz(let x, let y, let z):
      return "\(x.truncatingRemainder()) \(y.truncatingRemainder()) \(z.truncatingRemainder())"
    case .global(let global):
      return global.description
    }
  }
}
