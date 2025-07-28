//
// StrokeOpacity.swift

import CSSTypeTypes

/// The `stroke-opacity` CSS property defines the opacity of an SVG shape's stroke. The effect is identical to that
/// of `opacity`, except it is applied only to the stroke, not to the entire element.
///
/// This property applies to SVG shapes and text-content elements, but as an inherited property, it may be applied
/// to elements such as `<g>` and still have the intended effect on descendant elements' strokes.
///
/// ```css
/// stroke-opacity: 1;
/// stroke-opacity: 0.3;
/// stroke-opacity: 50%;
/// ```
public enum StrokeOpacity: Property {
    public static let property: String = "stroke-opacity"

    /// A numeric opacity value between 0 and 1
    case number(Number)

    /// A percentage opacity value between 0% and 100%
    case percentage(Percentage)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .number(let number):
            // Clamp opacity value between 0 and 1
            let clampedValue = min(1.0, max(0.0, number.value))
            return String(format: "%.5g", clampedValue)
        case .percentage(let percentage):
            return percentage.description
        case .global(let global):
            return global.description
        }
    }

    /// Creates a StrokeOpacity with a numeric value
    /// - Parameter value: The opacity value between 0 and 1
    /// - Returns: A StrokeOpacity with the specified numeric value
    public static func opacity(_ value: Double) -> Self {
        .number(.init(value))
    }

    /// Creates a StrokeOpacity with a percentage value
    /// - Parameter value: The opacity percentage value
    /// - Returns: A StrokeOpacity with the specified percentage value
    public static func percent(_ value: Double) -> Self {
        .percentage(.init(value))
    }
}
