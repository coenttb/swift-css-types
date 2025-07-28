import CSSTypeTypes
import Foundation

/// Represents the CSS `border-start-end-radius` property, which rounds the corner between
/// the block-start and inline-end edges of an element.
///
/// This logical property sets the radius of the corner between the block-start and inline-end
/// edges of an element based on its writing mode, direction, and text orientation. For example,
/// in horizontal-tb writing mode with ltr direction, it corresponds to `border-top-right-radius`.
///
/// Visual Reference:
/// ```
/// horizontal-tb, ltr:                 horizontal-tb, rtl:
/// ┌────────────╮────────────────┐     ┌────────────────╮────────────┐
/// │                             │     │                             │
/// │                             │     │                             │
/// │                             │     │                             │
/// │                             │     │                             │
/// └─────────────────────────────┘     └─────────────────────────────┘
///   Maps to border-top-right-radius     Maps to border-top-left-radius
///
/// vertical-rl:                        vertical-lr:
/// ┌─────────────────────────────┐     ┌─────────────────────────────┐
/// │                             │     ╭                             │
/// │                             │     │                             │
/// │                             │     │                             │
/// ╮                             │     │                             │
/// └─────────────────────────────┘     └─────────────────────────────┘
///   Maps to border-top-left-radius     Maps to border-bottom-left-radius
/// ```
///
/// Example:
/// ```swift
/// // Create a circular corner with a 10px radius
/// .borderStartEndRadius(.radius(.px(10)))
///
/// // Create a circular corner with a percentage radius
/// .borderStartEndRadius(.radius(.percentage(25)))
///
/// // Create an elliptical corner (40px horizontal, 20px vertical)
/// .borderStartEndRadius(.elliptical(.px(40), .px(20)))
///
/// // Create an elliptical corner with mixed units
/// .borderStartEndRadius(.elliptical(.percentage(20), .px(15)))
///
/// // Use a global value
/// .borderStartEndRadius(.global(.inherit))
/// ```
///
/// - Note: When using percentages, the horizontal radius is a percentage of the element's width,
///         and the vertical radius is a percentage of the element's height.
///
/// - SeeAlso: [MDN Web Docs on border-start-end-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-start-end-radius)
public enum BorderStartEndRadius: Property {

    public static let property: String = "border-start-end-radius"

    /// A circular corner with a single radius
    case radius(LengthPercentage)

    /// An elliptical corner with horizontal and vertical radii
    case elliptical(LengthPercentage, LengthPercentage)

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Convenience initializers for BorderStartEndRadius
extension BorderStartEndRadius {
    /// Creates a border-start-end-radius with a circular corner
    ///
    /// - Parameter radius: The radius of the corner
    public init(_ radius: LengthPercentage) {
        self = .radius(radius)
    }

    /// Creates a border-start-end-radius with an elliptical corner
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radius of the corner
    ///   - vertical: The vertical radius of the corner
    public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage) {
        self = .elliptical(horizontal, vertical)
    }

    /// Creates a border-start-end-radius with a circular corner
    ///
    /// - Parameter radius: The radius of the corner
    public init(radius: LengthPercentage) {
        self = .radius(radius)
    }

    /// Creates a border-start-end-radius with an elliptical corner
    ///
    /// - Parameters:
    ///   - horizontalRadius: The horizontal radius of the corner
    ///   - verticalRadius: The vertical radius of the corner
    public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
        self = .elliptical(horizontalRadius, verticalRadius)
    }
}

/// Support for LengthPercentageConvertible
extension BorderStartEndRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> BorderStartEndRadius {
        .radius(value)
    }
}

/// Provides string conversion for CSS output
extension BorderStartEndRadius: CustomStringConvertible {
    /// Converts the border-start-end-radius to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-start-end-radius: 10px;
    /// border-start-end-radius: 25%;
    /// border-start-end-radius: 40px 20px;
    /// border-start-end-radius: 20% 15px;
    /// border-start-end-radius: inherit;
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
