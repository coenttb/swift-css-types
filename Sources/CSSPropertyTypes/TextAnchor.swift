import CSSTypeTypes
import Foundation

/// Aligns a box containing a string of text relative to the anchor point of the element in SVG.
///
/// The text-anchor CSS property aligns a box containing a string of text where the 
/// wrapping area is determined from the inline-size property, and the text is then 
/// placed relative to the anchor point of the element, which is defined using the x and y 
/// (or dx and dy) attributes.
///
/// Note: text-anchor values only have an effect on the <text>, <textPath>, <tref>, and <tspan> 
/// SVG elements. text-anchor does not apply to automatically wrapped text; for that, see text-align.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-anchor)
///
/// # Example
/// ```swift
/// let style = Text.textAnchor(.start)
/// let style = Text.textAnchor(.middle)
/// let style = Text.textAnchor(.end)
/// ```
///
/// # CSS Values
/// ```css
/// text-anchor: start;
/// text-anchor: middle;
/// text-anchor: end;
/// ```
public enum TextAnchor: Property {
    public static let property: String = "text-anchor"

    /// Aligns the text such that the inline start of the text string is aligned with
    /// the anchor point. This is the default value.
    case start

    /// Aligns the text such that the center (middle) of the text string's inline box 
    /// is aligned with the anchor point.
    case middle

    /// Aligns the text such that the inline end of the text string is aligned with 
    /// the anchor point.
    case end

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextAnchor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .start:
            return "start"
        case .middle:
            return "middle"
        case .end:
            return "end"
        case .global(let global):
            return global.description
        }
    }
}
