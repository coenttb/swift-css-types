import CSSTypeTypes
import Foundation

/// The CSS `min-block-size` property defines the minimum size of an element in the block direction.
/// When writing mode is horizontal, this refers to the element's minimum height. When writing mode
/// is vertical, this refers to the element's minimum width.
///
/// Example:
/// ```swift
/// .minBlockSize(.px(150))            // min-block-size: 150px
/// .minBlockSize(.em(20))             // min-block-size: 20em
/// .minBlockSize(.percentage(75))     // min-block-size: 75%
/// .minBlockSize(.auto)               // min-block-size: auto
/// .minBlockSize(.maxContent)         // min-block-size: max-content
/// ```
///
/// - Note: This is a logical property that adapts to the writing mode of the document.
///
/// - SeeAlso: [MDN Web Docs on min-block-size](https://developer.mozilla.org/en-US/docs/Web/CSS/min-block-size)
public enum MinBlockSize: Property {
  public static let property: String = "min-block-size"

  /// A specific size value (length, percentage, or calculated value)
  case size(Size)

  /// A global CSS value
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MinBlockSize: CustomStringConvertible {
  /// Converts the min-block-size value to its CSS string representation
  public var description: String {
    switch self {
    case .size(let size):
      return size.description
    case .global(let global):
      return global.description
    }
  }
}

extension MinBlockSize: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> MinBlockSize {
    .size(.single(length))
  }
}

extension MinBlockSize {
  /// Automatic sizing (often resolves to 0)
  public static let auto: MinBlockSize = .size(.auto)

  /// Size based on the content's preferred size
  public static let maxContent: MinBlockSize = .size(.maxContent)

  /// Size based on the content's minimum size
  public static let minContent: MinBlockSize = .size(.minContent)

  /// Size that uses available space up to the max-content size
  public static let fitContent: MinBlockSize = .size(.fitContent)

  /// Size to fit within the element while preserving aspect ratio
  public static let contain: MinBlockSize = .size(.contain)

  /// Size to cover the entire element while preserving aspect ratio
  public static let cover: MinBlockSize = .size(.cover)
}

/// Allow for numeric literals to be used directly
extension MinBlockSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  /// Creates a min-block-size with a pixel value from an integer literal
  ///
  /// - Parameter value: The pixel value as an integer
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }

  /// Creates a min-block-size with a pixel value from a floating-point literal
  ///
  /// - Parameter value: The pixel value as a double
  public init(floatLiteral value: Double) {
    self = .px(value)
  }
}
