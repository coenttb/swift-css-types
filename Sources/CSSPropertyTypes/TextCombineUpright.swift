import Foundation
import CSSTypeTypes

/// The CSS `text-combine-upright` property sets the combination of characters into the space 
/// of a single character.
///
/// If the combined text is wider than 1em, the user agent must fit the contents within 1em.
/// The resulting composition is treated as a single upright glyph for layout and decoration.
/// This property only has an effect in vertical writing modes.
///
/// This is used to produce an effect that is known as tate-chū-yoko (縦中横) in Japanese,
/// or as 橫向文字 in Chinese.
///
/// Example:
/// ```swift
/// .textCombineUpright(.none)       // text-combine-upright: none
/// .textCombineUpright(.all)        // text-combine-upright: all
/// .textCombineUpright(.digits(2))  // text-combine-upright: digits 2
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-combine-upright](https://developer.mozilla.org/en-US/docs/Web/CSS/text-combine-upright)
public enum TextCombineUpright: Property {
    public static let property: String = "text-combine-upright"
    
    /// There is no special processing.
    case none
    
    /// Attempts to typeset all consecutive characters within the box horizontally,
    /// such that they take up the space of a single character within the vertical line of the box.
    case all
    
    /// Attempts to display a sequence of consecutive ASCII digits (U+0030–U+0039) that is n or
    /// fewer characters wide as a single horizontally oriented character.
    /// If the sequence is wider than n characters, then the user agent must
    /// render the text as if text-combine-upright were none.
    case digits(Int)
    
    /// Global value
    case global(CSSTypeTypes.Global)
}

extension TextCombineUpright: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .digits(value)
    }
}

/// CSS Output conversion
extension TextCombineUpright: CustomStringConvertible {
    /// Converts the text-combine-upright value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .all:
            return "all"
            
        case .digits(let count):
            return "digits \(count)"
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience factories
extension TextCombineUpright {
    /// Combines 2 digits into a single character space
    public static var digits2: TextCombineUpright {
        .digits(2)
    }
    
    /// Combines 3 digits into a single character space
    public static var digits3: TextCombineUpright {
        .digits(3)
    }
    
    /// Combines 4 digits into a single character space
    public static var digits4: TextCombineUpright {
        .digits(4)
    }
}
