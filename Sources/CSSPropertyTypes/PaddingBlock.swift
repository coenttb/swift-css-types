import CSSTypeTypes
import Foundation

/// The CSS `padding-block` shorthand property defines the logical block start and end padding of an element,
/// which maps to physical padding properties depending on the element's writing mode, directionality, and text orientation.
///
/// This is part of CSS Logical Properties, which are writing-mode aware equivalents of physical properties.
/// For example, in a horizontal top-to-bottom writing mode (like English), `padding-block` is equivalent
/// to `padding-top` and `padding-bottom`.
///
/// Example:
/// ```swift
/// .paddingBlock(.px(20))                   // padding-block: 20px
/// .paddingBlock(.px(10), .px(20))          // padding-block: 10px 20px
/// .paddingBlock(.em(1), .percentage(5))       // padding-block: 1em 5%
/// .paddingBlock(0)                         // padding-block: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-block](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block)
public enum PaddingBlock: Property {
  public static let property: String = "padding-block"

  /// Single value for both block-start and block-end padding
  case uniform(LengthPercentage)

  /// Two values: the first for block-start and the second for block-end padding
  case separate(LengthPercentage, LengthPercentage)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingBlock: CustomStringConvertible {
  /// Converts the padding-block value to its CSS string representation
  public var description: String {
    switch self {
    case .uniform(let value):
      return value.description

    case .separate(let start, let end):
      return "\(start) \(end)"

    case .global(let global):
      return global.description
    }
  }
}

/// Convenience initializers
extension PaddingBlock {

  /// Creates a padding-block with separate start and end values
  ///
  /// - Parameters:
  ///   - start: The block-start padding
  ///   - end: The block-end padding
  /// - Returns: A PaddingBlock instance
  public static func separate(start: LengthPercentage, end: LengthPercentage) -> PaddingBlock {
    .separate(start, end)
  }

  /// Creates a padding-block with pixel values
  ///
  /// - Parameters:
  ///   - start: The block-start padding in pixels
  ///   - end: The optional block-end padding in pixels (if not provided, start is used for both)
  /// - Returns: A PaddingBlock instance
  public static func px(_ start: Double, _ end: Double? = nil) -> PaddingBlock {
    if let end = end {
      return .separate(.px(start), .px(end))
    }
    return .uniform(.px(start))
  }

  /// Creates a padding-block with em values
  ///
  /// - Parameters:
  ///   - start: The block-start padding in ems
  ///   - end: The optional block-end padding in ems (if not provided, start is used for both)
  /// - Returns: A PaddingBlock instance
  public static func em(_ start: Double, _ end: Double? = nil) -> PaddingBlock {
    if let end = end {
      return .separate(.em(start), .em(end))
    }
    return .uniform(.em(start))
  }

  /// Creates a padding-block with percentage values
  ///
  /// - Parameters:
  ///   - start: The block-start padding as a percentage
  ///   - end: The optional block-end padding as a percentage (if not provided, start is used for both)
  /// - Returns: A PaddingBlock instance
  public static func percentage(_ start: Percentage, _ end: Percentage? = nil) -> PaddingBlock {
    if let end = end {
      return .separate(.percentage(start), .percentage(end))
    }
    return .uniform(.percentage(start))
  }

  /// Creates a padding-block with a zero value for both sides
  public static let zero: PaddingBlock = .uniform(.px(0))
}

extension PaddingBlock: ExpressibleByIntegerLiteral {
  /// Creates a padding-block from an integer literal (interpreted as pixels for both sides)
  ///
  /// - Parameter value: The padding in pixels
  public init(integerLiteral value: Int) {
    self = .uniform(.px(Double(value)))
  }
}

extension PaddingBlock: ExpressibleByFloatLiteral {
  /// Creates a padding-block from a floating-point literal (interpreted as pixels for both sides)
  ///
  /// - Parameter value: The padding in pixels
  public init(floatLiteral value: Double) {
    self = .uniform(.px(value))
  }
}
