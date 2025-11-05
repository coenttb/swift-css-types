import CSSTypeTypes
import Foundation

/// Represents the CSS `border-bottom-width` property, which sets the width of the bottom border.
///
/// This property sets the width for the bottom border of an element.
///
/// Visual Reference:
/// ```
/// Different width values:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-bottom-width: thin
///
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └═══════════════════════════┘   ← border-bottom-width: thick
/// ```
///
/// Example:
/// ```swift
/// // Set the bottom border width to thin
/// .borderBottomWidth(.thin)
///
/// // Set the bottom border width to medium
/// .borderBottomWidth(.medium)
///
/// // Set the bottom border width to thick
/// .borderBottomWidth(.thick)
///
/// // Set the bottom border width to a specific pixel value
/// .borderBottomWidth(.px(3))
/// ```
///
/// - Note: For the border to be visible, you must also set `border-bottom-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-bottom-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width)
public enum BorderBottomWidth: Property {

    public static let property: String = "border-bottom-width"

    /// A specific width for the bottom border
    case width(BorderWidth)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-bottom-width with a specific border width
    ///
    /// - Parameter width: The width for the bottom border
    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

/// Provides string conversion for CSS output
extension BorderBottomWidth: CustomStringConvertible {
    /// Converts the border-bottom-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-bottom-width: thin;
    /// border-bottom-width: medium;
    /// border-bottom-width: thick;
    /// border-bottom-width: 3px;
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

/// Convenience methods for creating BorderBottomWidth values
extension BorderBottomWidth {
    /// The default border-bottom-width value (medium)
    public static let `default` = BorderBottomWidth(.medium)

    /// Creates a thin border-bottom-width
    public static let thin = BorderBottomWidth(.thin)

    /// Creates a medium border-bottom-width
    public static let medium = BorderBottomWidth(.medium)

    /// Creates a thick border-bottom-width
    public static let thick = BorderBottomWidth(.thick)
}
