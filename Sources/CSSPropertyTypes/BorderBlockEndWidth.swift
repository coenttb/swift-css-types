import Foundation
import CSSTypeTypes

/// Represents the CSS `border-block-end-width` property, which sets the width of the logical block-end border.
///
/// This logical property sets the width for the block-end border of an element. The actual physical
/// border it affects depends on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-end-width` sets the width
/// of the bottom border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └═══════════════════════════┘   ← border-block-end-width: thick (bottom)
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///   ↑
///   border-block-end-width: thick (left)
/// ```
///
/// Example:
/// ```swift
/// // Set the block-end border width to thin
/// .borderBlockEndWidth(.thin)
///
/// // Set the block-end border width to medium
/// .borderBlockEndWidth(.medium)
///
/// // Set the block-end border width to thick
/// .borderBlockEndWidth(.thick)
///
/// // Set the block-end border width to a specific pixel value
/// .borderBlockEndWidth(.px(3))
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document, 
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-end-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-width)
public enum BorderBlockEndWidth: Property {
    
    public static let property: String = "border-block-end-width"
    
        
    /// A specific width for the block-end border
    case width(BorderWidth)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border-block-end-width with a specific border width
    ///
    /// - Parameter width: The width for the block-end border
    public init(_ width: BorderWidth) {
        self = .width(width)
    }
}

extension BorderBlockEndWidth: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> BorderBlockEndWidth {
        .width(.init(length))
    }
}

/// Provides string conversion for CSS output
extension BorderBlockEndWidth: CustomStringConvertible {
    /// Converts the border-block-end-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-block-end-width: thin;
    /// border-block-end-width: medium;
    /// border-block-end-width: thick;
    /// border-block-end-width: 3px;
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

/// Convenience methods for creating BorderBlockEndWidth values
extension BorderBlockEndWidth {
    /// The default border-block-end-width value (medium)
    public static let `default` = BorderBlockEndWidth(.medium)
    
    /// Creates a thin border-block-end-width
    public static let thin = BorderBlockEndWidth(.thin)
    
    /// Creates a medium border-block-end-width
    public static let medium = BorderBlockEndWidth(.medium)
    
    /// Creates a thick border-block-end-width
    public static let thick = BorderBlockEndWidth(.thick)
    
    /// Creates a border-block-end-width with a specific pixel value
    ///
    /// - Parameter px: The pixel value
    /// - Returns: A border-block-end-width with the specified pixel value
    public static func px(_ px: Double) -> BorderBlockEndWidth {
        .width(.px(px))
    }
    
    /// Creates a border-block-end-width with a specific percentage value
    ///
    /// - Parameter percent: The percentage value
    /// - Returns: A border-block-end-width with the specified percentage value
    public static func percentage(_ percentage: Percentage) -> BorderBlockEndWidth {
        //        Type 'BorderWidth' has no member 'percent'
        //        .width(.percentage(percentage))
                fatalError()
    }
}
