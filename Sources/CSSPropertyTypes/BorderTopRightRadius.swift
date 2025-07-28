import CSSTypeTypes
import Foundation

/// Represents the CSS `border-top-right-radius` property, which rounds the top-right corner of an element.
///
/// This property sets the radius of the top-right corner of an element's border box.
/// It can create rounded corners with a circular arc or an elliptical arc depending
/// on whether one or two values are specified.
///
/// Visual Reference:
/// ```
/// Circular corner:                    Elliptical corner:
/// ┌────────────────╮────────────┐       ┌─────────────╮─────────────┐
/// │                             │       │                           │
/// │                             │       │                           │
/// │                             │       │                           │
/// │                             │       │                           │
/// └─────────────────────────────┘       └───────────────────────────┘
///   border-top-right-radius: 20px        border-top-right-radius: 40px 20px
/// ```
///
/// Example:
/// ```swift
/// // Create a circular corner with a 10px radius
/// .borderTopRightRadius(.radius(.px(10)))
///
/// // Create a circular corner with a percentage radius
/// .borderTopRightRadius(.radius(.percentage(25)))
///
/// // Create an elliptical corner (40px horizontal, 20px vertical)
/// .borderTopRightRadius(.elliptical(.px(40), .px(20)))
///
/// // Create an elliptical corner with mixed units
/// .borderTopRightRadius(.elliptical(.percentage(20), .px(15)))
///
/// // Use a global value
/// .borderTopRightRadius(.global(.inherit))
/// ```
///
/// - Note: When using percentages, the horizontal radius is a percentage of the element's width,
///         and the vertical radius is a percentage of the element's height.
///
/// - SeeAlso: [MDN Web Docs on border-top-right-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-right-radius)
public enum BorderTopRightRadius: Property {
    public static let property: String = "border-top-right-radius"
    /// A single radius value for a circular corner
    case radius(LengthPercentage)

    /// Two radius values for an elliptical corner (horizontal, vertical)
    case elliptical(LengthPercentage, LengthPercentage)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-top-right-radius with the specified radius
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radius of the corner
    ///   - vertical: The vertical radius of the corner (optional, defaults to same as horizontal)
    public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage? = nil) {
        if let vertical = vertical {
            self = .elliptical(horizontal, vertical)
        } else {
            self = .radius(horizontal)
        }
    }

    /// Creates a border-top-right-radius with a circular corner
    ///
    /// - Parameter radius: The radius of the corner
    public init(radius: LengthPercentage) {
        self = .radius(radius)
    }

    /// Creates a border-top-right-radius with an elliptical corner
    ///
    /// - Parameters:
    ///   - horizontalRadius: The horizontal radius of the corner
    ///   - verticalRadius: The vertical radius of the corner
    public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
        self = .elliptical(horizontalRadius, verticalRadius)
    }
}

/// Support for LengthPercentageConvertible
extension BorderTopRightRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: LengthPercentage) -> BorderTopRightRadius {
        .radius(value)
    }
}

/// Support for PercentageConvertible
extension BorderTopRightRadius: PercentageConvertible {
    /// Creates a border-top-right-radius with a circular corner using percentage
    ///
    /// - Parameter percent: The radius as a percentage
    /// - Returns: A border-top-right-radius with the specified radius
    public static func percentage(_ percentage: Percentage) -> BorderTopRightRadius {
        .radius(.percentage(percentage))
    }
}

/// Provides string conversion for CSS output
extension BorderTopRightRadius: CustomStringConvertible {
    /// Converts the border-top-right-radius to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-top-right-radius: 10px;
    /// border-top-right-radius: 25%;
    /// border-top-right-radius: 40px 20px;
    /// border-top-right-radius: 20% 15px;
    /// border-top-right-radius: inherit;
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
