import CSSTypeTypes
import Foundation

/// The CSS `offset-anchor` property specifies the point inside the element's box
/// that moves along the offset-path.
///
/// This property determines which point of the element is positioned at the point
/// defined by offset-path and offset-distance.
///
/// Example:
/// ```swift
/// .offsetAnchor(.auto)           // offset-anchor: auto
/// .offsetAnchor(.topRight)      // offset-anchor: right top
/// .offsetAnchor(.bottomLeft)    // offset-anchor: left bottom
/// .offsetAnchor(.percentage(20, 80)) // offset-anchor: 20% 80%
/// ```
///
/// - SeeAlso: [MDN Web Docs on offset-anchor](https://developer.mozilla.org/en-US/docs/Web/CSS/offset-anchor)
public enum OffsetAnchor: Property {
  public static let property: String = "offset-anchor"

  /// The offset-anchor is given the same value as the element's transform-origin,
  /// unless offset-path is none, in which case it takes its value from offset-position
  case auto

  /// A specific position value
  case position(CSSTypeTypes.Position)

  /// Global value
  case global(CSSTypeTypes.Global)
}

extension OffsetAnchor: LengthPercentageConvertible {
  public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> OffsetAnchor {
    .position(.init(value))
  }
}

/// CSS Output conversion
extension OffsetAnchor: CustomStringConvertible {
  /// Converts the offset-anchor value to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .position(let position):
      return position.description
    case .global(let global):
      return global.description
    }
  }
}

/// Factory methods for common positions
extension OffsetAnchor {
  /// Creates an offset-anchor with the center position
  public static let center: OffsetAnchor = .position(.center)

  /// Creates an offset-anchor with the top position
  public static let top: OffsetAnchor = .position(.top)

  /// Creates an offset-anchor with the right position
  public static let right: OffsetAnchor = .position(.right)

  /// Creates an offset-anchor with the bottom position
  public static let bottom: OffsetAnchor = .position(.bottom)

  /// Creates an offset-anchor with the left position
  public static let left: OffsetAnchor = .position(.left)

  /// Creates an offset-anchor with the top-left position
  public static let topLeft: OffsetAnchor = .position(.topLeft)

  /// Creates an offset-anchor with the top-right position
  public static let topRight: OffsetAnchor = .position(.topRight)

  /// Creates an offset-anchor with the bottom-left position
  public static let bottomLeft: OffsetAnchor = .position(.bottomLeft)

  /// Creates an offset-anchor with the bottom-right position
  public static let bottomRight: OffsetAnchor = .position(.bottomRight)
}
