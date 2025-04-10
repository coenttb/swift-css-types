import Foundation
import CSSTypeTypes

/// Represents the CSS `border-start-start-radius` property, which rounds the corner between
/// the block-start and inline-start edges of an element.
///
/// This logical property sets the radius of the corner between the block-start and inline-start
/// edges of an element based on its writing mode, direction, and text orientation. For example,
/// in horizontal-tb writing mode with ltr direction, it corresponds to `border-top-left-radius`.
///
/// Visual Reference:
/// ```
/// horizontal-tb, ltr:                 horizontal-tb, rtl:
/// ┌╮───────────────────────────┐     ┌─────────────────────────╮┐
/// │                             │     │                         │
/// │                             │     │                         │
/// │                             │     │                         │
/// │                             │     │                         │
/// └─────────────────────────────┘     └─────────────────────────┘
///   Maps to border-top-left-radius     Maps to border-top-right-radius
///
/// vertical-rl:                        vertical-lr:
/// ┌─────────────────────────────┐     ┌─────────────────────────────┐
/// │                             │     │                             │
/// │                             │     │                             │
/// │                             │     │                             │
/// │                            ╭┘     │                             ╭
/// └─────────────────────────────┘     └─────────────────────────────┘
///   Maps to border-bottom-left-radius  Maps to border-top-left-radius
/// ```
///
/// Example:
/// ```swift
/// // Create a circular corner with a 10px radius
/// .borderStartStartRadius(.radius(.px(10)))
///
/// // Create a circular corner with a percentage radius
/// .borderStartStartRadius(.radius(.percentage(25)))
///
/// // Create an elliptical corner (40px horizontal, 20px vertical)
/// .borderStartStartRadius(.elliptical(.px(40), .px(20)))
///
/// // Create an elliptical corner with mixed units
/// .borderStartStartRadius(.elliptical(.percentage(20), .px(15)))
///
/// // Use a global value
/// .borderStartStartRadius(.global(.inherit))
/// ```
///
/// - Note: When using percentages, the horizontal radius is a percentage of the element's width,
///         and the vertical radius is a percentage of the element's height.
///
/// - SeeAlso: [MDN Web Docs on border-start-start-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-start-radius)
public enum BorderStartStartRadius: Property {
    
    public static let property: String = "border-start-start-radius"
    
    /// A circular corner with a single radius
    case radius(LengthPercentage)
    
    /// An elliptical corner with horizontal and vertical radii
    case elliptical(LengthPercentage, LengthPercentage)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Convenience initializers for BorderStartStartRadius
extension BorderStartStartRadius {
    /// Creates a border-start-start-radius with a circular corner
    ///
    /// - Parameter radius: The radius of the corner
    public init(_ radius: LengthPercentage) {
        self = .radius(radius)
    }
    
    /// Creates a border-start-start-radius with an elliptical corner
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radius of the corner
    ///   - vertical: The vertical radius of the corner
    public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage) {
        self = .elliptical(horizontal, vertical)
    }
    
    /// Creates a border-start-start-radius with a circular corner
    ///
    /// - Parameter radius: The radius of the corner
    public init(radius: LengthPercentage) {
        self = .radius(radius)
    }
    
    /// Creates a border-start-start-radius with an elliptical corner
    ///
    /// - Parameters:
    ///   - horizontalRadius: The horizontal radius of the corner
    ///   - verticalRadius: The vertical radius of the corner
    public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
        self = .elliptical(horizontalRadius, verticalRadius)
    }
}

/// Support for LengthPercentageConvertible
extension BorderStartStartRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> BorderStartStartRadius {
        .radius(value)
    }
}

/// Provides string conversion for CSS output
extension BorderStartStartRadius: CustomStringConvertible {
    /// Converts the border-start-start-radius to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-start-start-radius: 10px;
    /// border-start-start-radius: 25%;
    /// border-start-start-radius: 40px 20px;
    /// border-start-start-radius: 20% 15px;
    /// border-start-start-radius: inherit;
    /// ```
    public var description: String {
        switch self {
        case .radius(let radius):
            return radius.description
        case .elliptical(let horizontal, let vertical):
            return "\(horizontal.description) \(vertical.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderStartStartRadius values
extension BorderStartStartRadius {
    /// Creates a border-start-start-radius with a circular corner using pixel units
    ///
    /// - Parameter px: The radius in pixels
    /// - Returns: A border-start-start-radius with the specified radius
    public static func px(_ px: Double) -> BorderStartStartRadius {
        .radius(.px(px))
    }
    
    /// Creates a border-start-start-radius with an elliptical corner using pixel units
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radius in pixels
    ///   - vertical: The vertical radius in pixels
    /// - Returns: A border-start-start-radius with the specified radii
    public static func px(_ horizontal: Double, _ vertical: Double) -> BorderStartStartRadius {
        .elliptical(.px(horizontal), .px(vertical))
    }
    
    /// Creates a border-start-start-radius with an elliptical corner using percentages
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radius as a percentage
    ///   - vertical: The vertical radius as a percentage
    /// - Returns: A border-start-start-radius with the specified radii
    public static func percentage(_ horizontal: Percentage, _ vertical: Percentage) -> BorderStartStartRadius {
        .elliptical(.percentage(horizontal), .percentage(vertical))
    }
}
