import CSSTypeTypes
import Foundation

/// Represents the CSS `border-right-width` property, which sets the width of the right border.
///
/// This property sets the width for the right border of an element.
///
/// Visual Reference:
/// ```
/// Different width values:
/// ┌───────────────────────┬─────┐
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// │                       │     │
/// └───────────────────────┴─────┘
///                           ↑
///                           border-right-width: thin
///
/// ┌───────────────────────┬═════┐
/// │                       ┃     ┃
/// │                       ┃     ┃
/// │                       ┃     ┃
/// │                       ┃     ┃
/// │                       ┃     ┃
/// └───────────────────────┴═════┘
///                           ↑
///                           border-right-width: thick
/// ```
///
/// Example:
/// ```swift
/// // Set the right border width to thin
/// .borderRightWidth(.thin)
///
/// // Set the right border width to medium
/// .borderRightWidth(.medium)
///
/// // Set the right border width to thick
/// .borderRightWidth(.thick)
///
/// // Set the right border width to a specific pixel value
/// .borderRightWidth(.px(3))
/// ```
///
/// - Note: For the border to be visible, you must also set `border-right-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-right-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width)
public enum BorderRightWidth: Property {

  public static let property: String = "border-right-width"

  /// A specific width for the right border
  case width(BorderWidth)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-right-width with a specific border width
  ///
  /// - Parameter width: The width for the right border
  public init(_ width: BorderWidth) {
    self = .width(width)
  }
}

/// Provides string conversion for CSS output
extension BorderRightWidth: CustomStringConvertible {
  /// Converts the border-right-width to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-right-width: thin;
  /// border-right-width: medium;
  /// border-right-width: thick;
  /// border-right-width: 3px;
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
extension BorderRightWidth: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> BorderRightWidth {
    .width(.length(length))
  }
}

/// Convenience methods for creating BorderRightWidth values
extension BorderRightWidth {
  /// The default border-right-width value (medium)
  public static let `default` = BorderRightWidth(.medium)

  /// Creates a thin border-right-width
  public static let thin = BorderRightWidth(.thin)

  /// Creates a medium border-right-width
  public static let medium = BorderRightWidth(.medium)

  /// Creates a thick border-right-width
  public static let thick = BorderRightWidth(.thick)

}
