import CSSTypeTypes
import Foundation

/// The `cy` CSS property defines the y-axis coordinate of the center point of SVG circle and ellipse elements.
///
/// This property overrides the SVG `cy` attribute if present. It only applies to `<circle>` and `<ellipse>`
/// elements nested in an `<svg>` element, not to other SVG elements or HTML elements.
///
/// - Note: For percentage values, the percentage is relative to the height of the current SVG viewport.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/cy)
public enum Cy: Property {
    public static let property: String = "cy"

    /// A specific length value
    case length(Length)

    /// A percentage of the SVG viewport height
    case percentage(Percentage)

    /// A combination of length and percentage
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let percentage):
            return percentage.description
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let value):
            return value.description
        }
    }
}
