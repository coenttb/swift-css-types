import Foundation
import CSSTypeTypes

/// The CSS `font-variant-emoji` property specifies the default presentation style for displaying emojis.
///
/// This property is important for consistent emoji rendering across different platforms and ensuring
/// proper display in multilingual and international content. It gives developers control over how
/// emoji are displayed - as colorful emoji characters or as black and white text symbols.
///
/// - Note: Traditionally, this was done by appending a Variation Selector, U+FE0E for text
///         and U+FE0F for emoji, to the emoji code point. Only emojis listed as contributing
///         to a Unicode emoji presentation sequence are affected by this property.
///
/// Example:
/// ```swift
/// .fontVariantEmoji(.normal)       // font-variant-emoji: normal
/// .fontVariantEmoji(.text)         // font-variant-emoji: text
/// .fontVariantEmoji(.emoji)        // font-variant-emoji: emoji
/// .fontVariantEmoji(.unicode)      // font-variant-emoji: unicode
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant-emoji](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-emoji)
public enum FontVariantEmoji:  Property {
    
    public static let property: String = "font-variant-emoji"
    
    /// Allows a browser to choose how to display the emoji.
    /// This often follows the operating system setting.
    case normal
    
    /// Renders the emoji as if it were using the unicode text variation selector (U+FE0E).
    /// Results in a monochrome, text-style presentation.
    case text
    
    /// Renders the emoji as if it were using the unicode emoji variation selector (U+FE0F).
    /// Results in a colorful, pictographic presentation.
    case emoji
    
    /// Renders the emoji in accordance with the Emoji presentation properties.
    /// If variation selectors are present, they override this value setting.
    case unicode
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .text:
            return "text"
        case .emoji:
            return "emoji"
        case .unicode:
            return "unicode"
        case .global(let global):
            return global.description
        }
    }
}
