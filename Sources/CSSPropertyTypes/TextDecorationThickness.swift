import Foundation
import CSSTypeTypes

/// Sets the thickness of lines used for text decoration (underline, overline, line-through).
///
/// The text-decoration-thickness CSS property sets the stroke thickness of the decoration line
/// that is used on text in an element, such as a line-through, underline, or overline.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-thickness)
///
/// # Example
/// ```swift
/// let style = Text.textDecorationThickness(.auto)
/// let style = Text.textDecorationThickness(.length(.px(2)))
/// let style = Text.textDecorationThickness(.percentage(150))
/// let style = Text.textDecorationThickness(.fromFont)
/// ```
///
/// # CSS Values
/// ```css
/// text-decoration-thickness: auto;
/// text-decoration-thickness: 3px;
/// text-decoration-thickness: 20%;
/// text-decoration-thickness: from-font;
/// ```
public enum TextDecorationThickness: Property, LengthPercentageConvertible {
    public static let property: String = "text-decoration-thickness"
    
    /// The UA chooses an appropriate thickness for text decoration lines.
    case auto
    
    /// Specifies that text decoration lines should use the thickness specified by the font file.
    case fromFont
    
    /// A length or percentage value measured from the beginning of the timeline
    case lengthPercentage(LengthPercentage)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextDecorationThickness: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .fromFont:
            return "from-font"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let global):
            return global.description
        }
    }
}
