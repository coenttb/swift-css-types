import Foundation
import CSSTypeTypes

/// The `cx` CSS property defines the x-axis coordinate of the center point of SVG circle and ellipse elements.
///
/// This property overrides the SVG `cx` attribute if present. It only applies to `<circle>` and `<ellipse>` 
/// elements nested in an `<svg>` element, not to other SVG elements or HTML elements.
///
/// - Note: For percentage values, the percentage is relative to the width of the current SVG viewport.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/cx)
public enum Cx: Property {
    public static let property: String = "cx"
    /// A specific length value
    case length(Length)
    
    /// A percentage of the SVG viewport width
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
