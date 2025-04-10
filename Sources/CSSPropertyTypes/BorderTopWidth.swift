import Foundation
import CSSTypeTypes

/// Represents the CSS `border-top-width` property, which sets the width of the top border.
///
/// This property sets the width for the top border of an element.
///
/// Visual Reference:
/// ```
/// Different width values:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-top-width: thin
///
/// ┌═══════════════════════════┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-top-width: thick
/// ```
///
/// Example:
/// ```swift
/// // Set the top border width to thin
/// .borderTopWidth(.thin)
///
/// // Set the top border width to medium
/// .borderTopWidth(.medium)
///
/// // Set the top border width to thick
/// .borderTopWidth(.thick)
///
/// // Set the top border width to a specific pixel value
/// .borderTopWidth(.px(3))
/// ```
///
/// - Note: For the border to be visible, you must also set `border-top-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-top-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)
public enum BorderTopWidth: Property {
    public static let property: String = "border-top-width"
    
    /// A specific width for the top border
    case width(BorderWidth)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-top-width with a specific border width
    ///
    /// - Parameter width: The width for the top border
    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

/// Provides string conversion for CSS output
extension BorderTopWidth: CustomStringConvertible {
    /// Converts the border-top-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-top-width: thin;
    /// border-top-width: medium;
    /// border-top-width: thick;
    /// border-top-width: 3px;
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

/// Convenience methods for creating BorderTopWidth values
extension BorderTopWidth {
    /// The default border-top-width value (medium)
    public static let `default` = BorderTopWidth(.medium)
    
    /// Creates a thin border-top-width
    public static let thin = BorderTopWidth(.thin)
    
    /// Creates a medium border-top-width
    public static let medium = BorderTopWidth(.medium)
    
    /// Creates a thick border-top-width
    public static let thick = BorderTopWidth(.thick)
    
    /// Creates a border-top-width with a specific pixel value
    ///
    /// - Parameter px: The pixel value
    /// - Returns: A border-top-width with the specified pixel value
    public static func px(_ px: Double) -> BorderTopWidth {
        .width(.px(px))
    }
    
    /// Creates a border-top-width with a specific percentage value
    ///
    /// - Parameter percent: The percentage value
    /// - Returns: A border-top-width with the specified percentage value
    public static func percentage(_ percentage: Percentage) -> BorderTopWidth {
//     THIS IS INCORRECT:   .width(.percentage(percentage)), BECAUSE: Type 'BorderWidth' has no member 'percent'
        fatalError()
    }
}
