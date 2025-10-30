import CSSTypeTypes
import Foundation

/// The CSS `gap` shorthand property sets the gaps (gutters) between rows and columns.
///
/// This property applies to multi-column, flex, and grid containers. It's useful for creating
/// consistent spacing in layouts regardless of writing mode or text direction, which is
/// essential for proper internationalization.
///
/// Example:
/// ```swift
/// .gap(.px(20))                        // gap: 20px
/// .gap(.percentage(10))                // gap: 10%
/// .gap(.length(1, .em))                // gap: 1em
/// .gap(.px(20), .px(10))               // gap: 20px 10px
/// .gap(.percentage(10), .percentage(5)) // gap: 10% 5%
/// ```
///
/// - Note: In grid and flex layouts with different writing modes, the property
///         adapts to maintain consistent spacing regardless of text direction.
///
/// - SeeAlso: [MDN Web Docs on gap](https://developer.mozilla.org/en-US/docs/Web/CSS/gap)
public enum Gap: Property {

  public static let property: String = "gap"

  /// A single gap value for both row and column gaps
  case single(GapValue)

  /// Separate values for row gap and column gap
  case double(GapValue, GapValue)

  /// Global values
  case global(CSSTypeTypes.Global)
}

extension Gap: LengthConvertible {
  /// Factory method for creating a length-based gap
  public static func length(_ value: Length) -> Gap {
    .single(.length(value))
  }
}

extension Gap: PercentageConvertible {
  /// Factory method for percentage with the same value for row and column gaps
  public static func percentage(_ value: Percentage) -> Gap {
    .single(.percentage(value))
  }
}

extension Gap {
  /// Factory method for percentage with different values for row and column gaps
  public static func percentage(_ rowGap: Percentage, _ columnGap: Percentage) -> Gap {
    .double(.percentage(rowGap), .percentage(columnGap))
  }
}

/// Represents a gap value which can be a length or percentage
public enum GapValue: Sendable, Hashable {
  /// Normal gap value (default, usually 0 except in multi-column layout)
  case normal

  /// A specific length value
  case length(Length)

  /// A percentage of the container's width or height
  case percentage(Percentage)
}

/// CSS Output conversion
extension GapValue: CustomStringConvertible {
  /// Converts the gap value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .length(let value):
      return value.description

    case .percentage(let percentage):
      return percentage.description
    }
  }
}

/// CSS Output conversion
extension Gap: CustomStringConvertible {
  /// Converts the gap value to its CSS string representation
  public var description: String {
    switch self {
    case .single(let gap):
      return gap.description

    case .double(let rowGap, let columnGap):
      return "\(rowGap) \(columnGap)"

    case .global(let global):
      return global.description
    }
  }
}
