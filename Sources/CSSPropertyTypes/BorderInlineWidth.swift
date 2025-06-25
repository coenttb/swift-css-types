import Foundation
import CSSTypeTypes

/// Represents the CSS `border-inline-width` property, which sets the width of the logical inline borders.
///
/// This logical property sets the width for the inline borders of an element. The actual physical 
/// borders it affects depend on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-inline-width` sets the width
/// of the left and right borders.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌─────┬─────────────────┬─────┐
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// └─────┴─────────────────┴─────┘
///   ↑                       ↑
///   border-inline-start-    border-inline-end-
///   width (left)            width (right)
///
/// vertical-rl writing mode:
/// ┌─────────────────────────────┐
/// │                             │   ← border-inline-start-width (top)
/// ├─────────────────────────────┤
/// │                             │
/// │                             │
/// │                             │
/// ├─────────────────────────────┤
/// │                             │   ← border-inline-end-width (bottom)
/// └─────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the inline border width to a specific length
/// .borderInlineWidth(.px(5))
///
/// // Set the inline border width using a keyword
/// .borderInlineWidth(.thin)
/// .borderInlineWidth(.medium)
/// .borderInlineWidth(.thick)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document, 
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-inline-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-width)
public enum BorderInlineWidth: Property {
    
    public static let property: String = "border-inline-width"
    
    /// A specific width for both inline borders
    case width(BorderWidth)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-inline-width with a specific width
    ///
    /// - Parameter width: The width for both inline borders
    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}
extension BorderInlineWidth: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> BorderInlineWidth {
        .width(.length(length))
    }
}

/// Provides string conversion for CSS output
extension BorderInlineWidth: CustomStringConvertible {
    /// Converts the border-inline-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-inline-width: 5px;
    /// border-inline-width: thin;
    /// border-inline-width: medium;
    /// border-inline-width: thick;
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

/// Convenience methods for creating BorderInlineWidth values
extension BorderInlineWidth {
    /// The default border-inline-width value (medium)
    public static let `default` = BorderInlineWidth(.medium)
    
    /// Creates a thin border-inline-width
    public static let thin = BorderInlineWidth(.thin)
    
    /// Creates a medium border-inline-width
    public static let medium = BorderInlineWidth(.medium)
    
    /// Creates a thick border-inline-width
    public static let thick = BorderInlineWidth(.thick)

}
