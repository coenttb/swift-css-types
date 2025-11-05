import CSSTypeTypes
import Foundation

/// The CSS `stroke-dashoffset` property defines an offset for the starting point of the rendering of
/// an SVG element's associated dash array. If present, it overrides the element's stroke-dashoffset attribute.
///
/// This property applies to any SVG shape or text-content element, but as an inherited property,
/// it may be applied to elements such as `<g>` and still have the intended effect on descendant elements' strokes.
///
/// Example:
/// ```swift
/// .strokeDashoffset(0)               // stroke-dashoffset: 0
/// .strokeDashoffset(-5)              // stroke-dashoffset: -5
/// .strokeDashoffset(.px(5))          // stroke-dashoffset: 5px
/// .strokeDashoffset(.percentage(5))  // stroke-dashoffset: 5%
/// .strokeDashoffset(.global(.inherit)) // stroke-dashoffset: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on stroke-dashoffset](https://developer.mozilla.org/en-US/docs/Web/CSS/stroke-dashoffset)
public enum StrokeDashoffset: Property {
    public static let property: String = "stroke-dashoffset"

    /// A numeric value representing SVG units
    case number(Number)

    /// A length value
    case length(Length)

    /// A percentage value relative to the SVG viewport diagonal
    case percentage(Percentage)

    /// A length-percentage value
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension StrokeDashoffset: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let number):
            return number.description

        case .length(let length):
            return length.description

        case .percentage(let percentage):
            return percentage.description

        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

/// ExpressibleByIntegerLiteral and ExpressibleByFloatLiteral conformance for StrokeDashoffset
extension StrokeDashoffset: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a stroke-dashoffset value from an integer literal
    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }

    /// Creates a stroke-dashoffset value from a float literal
    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
}
