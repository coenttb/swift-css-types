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
public enum TextUnderlineOffset: Property {
    public static let property: String = "text-underline-offset"
    
    /// The browser chooses the appropriate offset for underlines.
    case auto
    
    /// Specifies the offset of underlines as a length, overriding the font file suggestion and
    /// the browser default. It is recommended to use em units so the offset scales with the font size.
    case length(Double, Length.Unit)
    
    /// Specifies the offset of underlines as a percentage of 1 em in the element's font.
    /// A percentage inherits as a relative value, and so therefore scales with changes in the font.
    case percentage(Percentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Factory method for creating a length value in em units
    public static func em(_ value: Double) -> TextUnderlineOffset {
        .length(value, .em)
    }
    
    /// Factory method for creating a length value in pixels
    public static func px(_ value: Double) -> TextUnderlineOffset {
        .length(value, .px)
    }
    
    /// Factory method for creating a length value in rem units
    public static func rem(_ value: Double) -> TextUnderlineOffset {
        .length(value, .rem)
    }
}

/// CSS Output conversion
extension TextUnderlineOffset: CustomStringConvertible {
    /// Converts the text-underline-offset value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .length(let value, let unit):
            return "\(value)\(unit)"
            
        case .percentage(let percentage):
            return percentage.description
            
        case .global(let global):
            return global.description
        }
    }
}
