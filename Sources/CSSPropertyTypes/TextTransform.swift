//
//  TextTransform.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `text-transform` property specifies how to capitalize an element's text.
///
/// It can be used to make text appear in all-uppercase or all-lowercase, or with each word capitalized.
/// It also can help improve legibility for ruby.
///
/// - Note: The text-transform property takes into account language-specific case mapping rules such as:
///   - In Turkic languages, there are two kinds of i, with and without the dot, and two case pairings: i/İ and ı/I.
///   - In German, the ß becomes SS in uppercase.
///   - In Dutch, the ij digraph becomes IJ, even with text-transform: capitalize
///
/// - SeeAlso: [MDN Web Docs on text-transform](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform)
public enum TextTransform: Property {
    public static let property: String = "text-transform"
    
    /// Prevents the case of all characters from being changed.
    case none
    
    /// Converts the first letter of each word to uppercase.
    /// Other characters remain unchanged (they retain their original case as written in the element's text).
    case capitalize
    
    /// Converts all characters to uppercase.
    case uppercase
    
    /// Converts all characters to lowercase.
    case lowercase
    
    /// Forces the writing of a character (mainly ideograms and Latin scripts) inside a square,
    /// allowing them to be aligned in the usual East Asian scripts (like Chinese or Japanese).
    case fullWidth
    
    /// Generally used for ruby annotation text, this converts all small Kana characters
    /// to the equivalent full-size Kana, to compensate for legibility issues at the small
    /// font sizes typically used in ruby.
    case fullSizeKana
    
    /// Used to automatically render text in math italic where appropriate.
    /// It transforms Latin and Greek letters, and a few other math-related symbols,
    /// to italic mathematical symbols but only if it's applied on a text node
    /// containing a single character.
    case mathAuto
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none: return "none"
        case .capitalize: return "capitalize"
        case .uppercase: return "uppercase"
        case .lowercase: return "lowercase"
        case .fullWidth: return "full-width"
        case .fullSizeKana: return "full-size-kana"
        case .mathAuto: return "math-auto"
        case .global(let global): return global.description
        }
    }
}
