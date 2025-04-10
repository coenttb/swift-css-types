import Foundation
import CSSTypeTypes

/// The `list-style-type` CSS property sets the marker (such as a disc, character, or custom
/// counter style) of a list item element.
///
/// This property is used to define the appearance of list item markers - the small symbols, 
/// numbers, or other indicators that precede list items in ordered and unordered lists.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)
public enum ListStyleType: Property {
    public static let property: String = "list-style-type"
    /// No marker is shown
    case none
    
    /// A filled circle (default value for unordered lists)
    case disc
    
    /// A hollow circle
    case circle
    
    /// A filled square
    case square
    
    /// Decimal numbers (1, 2, 3...)
    case decimal
    
    /// Decimal numbers with leading zeros (01, 02, 03...)
    case decimalLeadingZero
    
    /// Lowercase Roman numerals (i, ii, iii...)
    case lowerRoman
    
    /// Uppercase Roman numerals (I, II, III...)
    case upperRoman
    
    /// Lowercase ASCII letters (a, b, c...)
    case lowerAlpha
    
    /// Uppercase ASCII letters (A, B, C...)
    case upperAlpha
    
    /// Lowercase Latin alphabet (a, b, c...)
    case lowerLatin
    
    /// Uppercase Latin alphabet (A, B, C...)
    case upperLatin
    
    /// Traditional Armenian numbering
    case armenian
    
    /// Traditional Georgian numbering
    case georgian
    
    /// Traditional Hebrew numbering
    case hebrew
    
    /// Traditional Hiragana numbering
    case hiragana
    
    /// Traditional Hiragana iroha numbering
    case hiraganaIroha
    
    /// Traditional Katakana numbering
    case katakana
    
    /// Traditional Katakana iroha numbering
    case katakanaIroha
    
    /// CJK ideographic numbering
    case cjkIdeographic
    
    /// Plain ideographic numbers
    case simp
    
    /// Cambodian numbering
    case khmer
    
    /// Traditional Thai numbering
    case thai
    
    /// A string, which will be used as the marker
    case string(CSSString)
    
    /// Custom identifier, used for custom counter styles
    case custom(CustomIdent)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .disc:
            return "disc"
        case .circle:
            return "circle"
        case .square:
            return "square"
        case .decimal:
            return "decimal"
        case .decimalLeadingZero:
            return "decimal-leading-zero"
        case .lowerRoman:
            return "lower-roman"
        case .upperRoman:
            return "upper-roman"
        case .lowerAlpha:
            return "lower-alpha"
        case .upperAlpha:
            return "upper-alpha"
        case .lowerLatin:
            return "lower-latin"
        case .upperLatin:
            return "upper-latin"
        case .armenian:
            return "armenian"
        case .georgian:
            return "georgian"
        case .hebrew:
            return "hebrew"
        case .hiragana:
            return "hiragana"
        case .hiraganaIroha:
            return "hiragana-iroha"
        case .katakana:
            return "katakana"
        case .katakanaIroha:
            return "katakana-iroha"
        case .cjkIdeographic:
            return "cjk-ideographic"
        case .simp:
            return "simp-chinese-formal"
        case .khmer:
            return "khmer"
        case .thai:
            return "thai"
        case .string(let string):
            return string.description
        case .custom(let ident):
            return ident.description
        case .global(let value):
            return value.description
        }
    }
}
