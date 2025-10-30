import CSSTypeTypes
import Foundation

/// Represents the CSS `border-left-width` property, which sets the width of the left border.
///
/// This property sets the width for the left border of an element.
///
/// Visual Reference:
/// ```
/// Different width values:
/// ┌─────┬───────────────────────┐
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// └─────┴───────────────────────┘
///   ↑
///   border-left-width: thin
///
/// ┌═════┬───────────────────────┐
/// ┃     │                       │
/// ┃     │                       │
/// ┃     │                       │
/// ┃     │                       │
/// ┃     │                       │
/// └═════┴───────────────────────┘
///   ↑
///   border-left-width: thick
/// ```
///
/// Example:
/// ```swift
/// // Set the left border width to thin
/// .borderLeftWidth(.thin)
///
/// // Set the left border width to medium
/// .borderLeftWidth(.medium)
///
/// // Set the left border width to thick
/// .borderLeftWidth(.thick)
///
/// // Set the left border width to a specific pixel value
/// .borderLeftWidth(.px(3))
/// ```
///
/// - Note: For the border to be visible, you must also set `border-left-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-left-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width)
public enum BorderLeftWidth: Property {

  public static let property: String = "border-left-width"

  /// A specific width for the left border
  case width(BorderWidth)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-left-width with a specific border width
  ///
  /// - Parameter width: The width for the left border
  public init(_ width: BorderWidth) {
    self = .width(width)
  }
}
extension BorderLeftWidth: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> BorderLeftWidth {
    .width(.length(length))
  }
}

/// Provides string conversion for CSS output
extension BorderLeftWidth: CustomStringConvertible {
  /// Converts the border-left-width to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-left-width: thin;
  /// border-left-width: medium;
  /// border-left-width: thick;
  /// border-left-width: 3px;
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

/// Convenience methods for creating BorderLeftWidth values
extension BorderLeftWidth {
  /// The default border-left-width value (medium)
  public static let `default` = BorderLeftWidth(.medium)

  /// Creates a thin border-left-width
  public static let thin = BorderLeftWidth(.thin)

  /// Creates a medium border-left-width
  public static let medium = BorderLeftWidth(.medium)

  /// Creates a thick border-left-width
  public static let thick = BorderLeftWidth(.thick)
}
