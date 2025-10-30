import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-start-width` property, which sets the width of the logical block-start border.
///
/// This logical property sets the width for the block-start border of an element. The actual physical
/// border it affects depends on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-start-width` sets the width
/// of the top border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌═══════════════════════════┐   ← border-block-start-width: thick (top)
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │ ↑
/// │                           │ border-block-start-width: thick (right)
/// └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the block-start border width to thin
/// .borderBlockStartWidth(.thin)
///
/// // Set the block-start border width to medium
/// .borderBlockStartWidth(.medium)
///
/// // Set the block-start border width to thick
/// .borderBlockStartWidth(.thick)
///
/// // Set the block-start border width to a specific pixel value
/// .borderBlockStartWidth(.px(3))
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-start-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-width)
public enum BorderBlockStartWidth: Property {

  public static let property: String = "border-block-start-width"

  /// A specific width for the block-start border
  case width(BorderWidth)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-block-start-width with a specific border width
  ///
  /// - Parameter width: The width for the block-start border
  public init(_ width: BorderWidth) {
    self = .width(width)
  }
}

extension BorderBlockStartWidth: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> BorderBlockStartWidth {
    .width(.init(length))
  }
}

/// Provides string conversion for CSS output
extension BorderBlockStartWidth: CustomStringConvertible {
  /// Converts the border-block-start-width to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-block-start-width: thin;
  /// border-block-start-width: medium;
  /// border-block-start-width: thick;
  /// border-block-start-width: 3px;
  /// ```
  public var description: String {
    switch self {
    case .width(let width):
      return width.description
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for creating BorderBlockStartWidth values
extension BorderBlockStartWidth {
  /// The default border-block-start-width value (medium)
  public static let `default` = BorderBlockStartWidth(.medium)

  /// Creates a thin border-block-start-width
  public static let thin = BorderBlockStartWidth(.thin)

  /// Creates a medium border-block-start-width
  public static let medium = BorderBlockStartWidth(.medium)

  /// Creates a thick border-block-start-width
  public static let thick = BorderBlockStartWidth(.thick)

}
