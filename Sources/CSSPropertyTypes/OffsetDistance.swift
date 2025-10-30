import CSSTypeTypes
import Foundation

/// The CSS `offset-distance` property specifies a position along an `offset-path` for an element to be placed.
///
/// This property determines how far along a path the element should move. It's often animated to create motion
/// along the specified path.
///
/// Example:
/// ```swift
/// .offsetDistance(.percentage(50))   // offset-distance: 50%
/// .offsetDistance(.px(40))           // offset-distance: 40px
/// ```
///
/// - Note: The 0% represents the start of the path, while 100% represents the end of the path.
///
/// - SeeAlso: [MDN Web Docs on offset-distance](https://developer.mozilla.org/en-US/docs/Web/CSS/offset-distance)
public enum OffsetDistance: Property, LengthPercentageConvertible {
  public static let property: String = "offset-distance"

  /// A length or percentage value
  case lengthPercentage(LengthPercentage)

  /// Global value
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OffsetDistance: CustomStringConvertible {
  /// Converts the offset-distance value to its CSS string representation
  public var description: String {
    switch self {
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience factory methods for OffsetDistance
extension OffsetDistance {
  /// Creates an offset-distance with a percentage value
  ///
  /// - Parameter value: The percentage value (0-100)
  /// - Returns: An OffsetDistance with the specified percentage
  public static func percentage(_ value: Double) -> Self {
    .lengthPercentage(.percentage(Percentage(value)))
  }

  /// Creates an offset-distance with a pixel value
  ///
  /// - Parameter value: The pixel value
  /// - Returns: An OffsetDistance with the specified pixel length
  public static func px(_ value: Double) -> Self {
    .lengthPercentage(.px(value))
  }

  /// Creates an offset-distance with an em value
  ///
  /// - Parameter value: The em value
  /// - Returns: An OffsetDistance with the specified em length
  public static func em(_ value: Double) -> Self {
    .lengthPercentage(.em(value))
  }

  /// Creates an offset-distance with a rem value
  ///
  /// - Parameter value: The rem value
  /// - Returns: An OffsetDistance with the specified rem length
  public static func rem(_ value: Double) -> Self {
    .lengthPercentage(.rem(value))
  }
}

/// Allow for numeric literals to be used directly
extension OffsetDistance: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  /// Creates an offset-distance with a pixel value from an integer literal
  ///
  /// - Parameter value: The pixel value as an integer
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }

  /// Creates an offset-distance with a pixel value from a floating-point literal
  ///
  /// - Parameter value: The pixel value as a double
  public init(floatLiteral value: Double) {
    self = .px(value)
  }
}
