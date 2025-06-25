import Foundation
import CSSTypeTypes

/// The CSS `text-underline-offset` property sets the offset distance of an underline text
/// decoration line (applied using text-decoration) from its original position.
///
/// This property is not part of the text-decoration shorthand. While an element can have multiple
/// text-decoration lines, text-underline-offset only impacts underlining, and not other possible
/// line decoration options such as overline or line-through.
///
/// Example:
/// ```swift
/// .textUnderlineOffset(.auto)                   // text-underline-offset: auto
/// .textUnderlineOffset(.length(1, .em))         // text-underline-offset: 1em
/// .textUnderlineOffset(.percentage(20))         // text-underline-offset: 20%
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-underline-offset](https://developer.mozilla.org/en-US/docs/Web/CSS/text-underline-offset)
public enum TextUnderlineOffset: Property, LengthPercentageConvertible {
    public static let property: String = "text-underline-offset"
    
    /// The browser chooses the appropriate offset for underlines.
    case auto
    
    /// Specifies the offset of underlines as a length, overriding the font file suggestion and
    /// the browser default. It is recommended to use em units so the offset scales with the font size.
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TextUnderlineOffset: CustomStringConvertible {
    /// Converts the text-underline-offset value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .lengthPercentage(let value):
            return value.description
            
        case .global(let global):
            return global.description
        }
    }
}
