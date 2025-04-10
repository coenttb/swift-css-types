import Foundation
import CSSTypeTypes

/// The CSS `text-wrap-style` property controls how text inside an element is wrapped.
/// The different values provide alternate ways of wrapping the content of a block element.
/// It can also be set, and reset, using the `text-wrap` shorthand.
///
/// Example:
/// ```swift
/// .textWrapStyle(.auto)     // text-wrap-style: auto
/// .textWrapStyle(.balance)  // text-wrap-style: balance
/// .textWrapStyle(.pretty)   // text-wrap-style: pretty
/// .textWrapStyle(.stable)   // text-wrap-style: stable
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-wrap-style](https://developer.mozilla.org/en-US/docs/Web/CSS/text-wrap-style)
public enum TextWrapStyle: Property {
    public static let property: String = "text-wrap-style"
    
    /// Text is wrapped in the most performant way for the browser and does not take into account the number of characters.
    case auto
    
    /// Text is wrapped in a way that best balances the number of characters on each line, enhancing layout quality and legibility.
    /// Because counting characters and balancing them across multiple lines is computationally expensive, this value is only
    /// supported for blocks of text spanning a limited number of lines (six or less for Chromium and ten or less for Firefox).
    case balance
    
    /// Text is wrapped using a slower algorithm that favors better layout over speed. This is intended for body copy where
    /// good typography is favored over performance (for example, when the number of orphans should be kept to a minimum).
    case pretty
    
    /// Text is wrapped such that when the user is editing the content, the lines that come before the lines they are
    /// editing remain static rather than the whole block of text re-wrapping.
    case stable
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TextWrapStyle: CustomStringConvertible {
    /// Converts the text-wrap-style value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .balance:
            return "balance"
            
        case .pretty:
            return "pretty"
            
        case .stable:
            return "stable"
            
        case .global(let global):
            return global.description
        }
    }
}
