//
// StrokeWidth.swift

import CSSTypeTypes

/// The `stroke-width` CSS property defines the width of a stroke applied to SVG shapes.
/// If present, it overrides the element's stroke-width attribute.
///
/// This property applies to any SVG shape or text-content element, but as an inherited property,
/// it may be applied to elements such as `<g>` and still have the intended effect on descendant
/// elements' strokes. If the value evaluates to zero, the stroke is not drawn.
///
/// ```css
/// stroke-width: 1;
/// stroke-width: 1.414px;
/// stroke-width: 5%;
/// ```
public enum StrokeWidth: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible {
    public static let property: String = "stroke-width"

    case lengthPercentage(LengthPercentage)

    /// A number of SVG units for the stroke width
    case number(CSSTypeTypes.Number)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .number(let number):
            return number.description
        case .global(let global):
            return global.description
        }
    }

    /// Creates a StrokeWidth using an integer literal (interpreted as SVG units)
    public init(integerLiteral value: Int) {
        self = .number(.init(integerLiteral: value))
    }

    /// Creates a StrokeWidth using a floating-point literal (interpreted as SVG units)
    public init(floatLiteral value: Double) {
        self = .number(.init(floatLiteral: value))
    }
}
