import Foundation
import CSSTypeTypes

/// The CSS `flood-opacity` property defines the opacity of the color used in filter effects for
/// the `<feFlood>` and `<feDropShadow>` SVG filter elements.
///
/// This property applies only to SVG filter elements and overrides the element's flood-opacity attribute.
///
/// Example:
/// ```swift
/// .floodOpacity(0.5)              // flood-opacity: 0.5
/// .floodOpacity(50)               // flood-opacity: 50%
/// .floodOpacity(.global(.inherit)) // flood-opacity: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flood-opacity](https://developer.mozilla.org/en-US/docs/Web/CSS/flood-opacity)
public enum FloodOpacity: Property, PercentageConvertible {
    public static let property: String = "flood-opacity"
    
    /// A numeric opacity value between 0 and 1
    case number(Number)
    
    /// A percentage opacity value
    case percentage(Percentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Create a flood-opacity from an integer percentage
    public init(_ percentage: Percentage) {
        self = .percentage(percentage)
    }
    
    /// Create a flood-opacity from a decimal value (between 0 and 1)
    public init(_ opacity: Double) {
        if opacity >= 0 && opacity <= 1 {
            self = .number(.init(opacity))
        } else {
            // Assume it's a percentage if greater than 1 or less than 0
            self = .percentage(.init(opacity))
        }
    }
    
    public var description: String {
        switch self {
        case .number(let number):
            return max(0, min(1, number.value)).truncatingRemainder()
        case .percentage(let percentage):
            return percentage.description
        case .global(let value):
            return value.description
        }
    }
}
