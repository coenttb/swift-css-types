import Foundation
import CSSTypeTypes

/// Represents the CSS `border-end-end-radius` property, which defines a logical border radius on an element,
/// which maps to a physical border radius that depends on the element's writing-mode, direction, and text-orientation.
///
/// This property affects the corner between the block-end and the inline-end sides of the element.
/// For instance, in a horizontal-tb writing mode with ltr direction, it corresponds to the border-bottom-right-radius property.
///
/// Visual reference based on writing mode:
/// ```
/// horizontal-tb + ltr:          horizontal-tb + rtl:
/// ┌───────────────────┐         ┌───────────────────┐
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// └───────────────────┘         └───────────────────┘
///                    ▲                   ▲
///             border-end-end-radius    border-end-end-radius
///
/// vertical-rl:                vertical-lr:
/// ┌───────────────────┐       ┌───────────────────┐
/// │                   │       │                   │
/// │                   │       │                   │
/// │                   │       │                   │
/// │                   │       │                   │
/// └───────────────────┘       └───────────────────┘
///  ▲                                            ▲
/// border-end-end-radius                  border-end-end-radius
/// ```
///
/// Example:
/// ```swift
/// // Set the border-end-end-radius to 5px
/// .borderEndEndRadius(.px(5))
///
/// // Set the border-end-end-radius to different horizontal and vertical radii
/// .borderEndEndRadius(.px(5), .px(10))
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-end-end-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-end-radius)
public enum BorderEndEndRadius: Property {
    
    public static let property: String = "border-end-end-radius"
    
    /// A single radius applied to both the horizontal and vertical dimensions
    case radius(LengthPercentage)
    
    /// Different radii for horizontal and vertical dimensions
    case horizontal_vertical(LengthPercentage, LengthPercentage)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BorderEndEndRadius: CustomStringConvertible {
    /// Converts the border-end-end-radius to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-end-end-radius: 5px;
    /// border-end-end-radius: 5px 10px;
    /// ```
    public var description: String {
        switch self {
        case .radius(let radius):
            return radius.description
        case .horizontal_vertical(let horizontal, let vertical):
            return "\(horizontal) \(vertical)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods
extension BorderEndEndRadius {
    /// Creates a border-end-end-radius with the same radius for both horizontal and vertical dimensions
    ///
    /// - Parameter px: The radius in pixels
    /// - Returns: A BorderEndEndRadius value
    public static func px(_ value: Double) -> Self {
        .radius(.px(value))
    }
    
    /// Creates a border-end-end-radius with the same radius for both horizontal and vertical dimensions
    ///
    /// - Parameter em: The radius in em units
    /// - Returns: A BorderEndEndRadius value
    public static func em(_ value: Double) -> Self {
        .radius(.em(value))
    }
    
    /// Creates a border-end-end-radius with the same radius for both horizontal and vertical dimensions
    ///
    /// - Parameter rem: The radius in rem units
    /// - Returns: A BorderEndEndRadius value
    public static func rem(_ value: Double) -> Self {
        .radius(.rem(value))
    }
    
    /// Creates a border-end-end-radius with the same radius for both horizontal and vertical dimensions
    ///
    /// - Parameter percent: The radius as a percentage
    /// - Returns: A BorderEndEndRadius value
    public static func percentage(_ value: Percentage) -> Self {
        .radius(.percentage(value))
    }
}
