//
//  HyphenateLimitChars.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `hyphenate-limit-chars` property specifies the minimum word length to allow hyphenation of words
/// as well as the minimum number of characters before and after the hyphen.
///
/// This property provides fine-grained control over hyphenation in text. This control enables you to avoid
/// awkward hyphenations and set appropriate hyphenation for different languages, which, in turn, allows
/// for better typography.
///
/// - SeeAlso: [MDN Web Docs on hyphenate-limit-chars](https://developer.mozilla.org/en-US/docs/Web/CSS/hyphenate-limit-chars)
public enum HyphenateLimitChars: Property {

    public static let property: String = "hyphenate-limit-chars"

    /// The user agent will choose appropriate values for the current layout.
    /// Unless the user agent can calculate better values, the following defaults will be used:
    /// - Minimum word length to allow hyphenation: 5
    /// - Minimum number of characters before the hyphen: 2
    /// - Minimum number of characters after the hyphen: 2
    case auto

    /// Sets just the minimum word length to allow hyphenation.
    /// The minimum number of characters before and after the hyphen will be set to auto.
    case minimumWordLength(Int)

    /// Sets the minimum word length to allow hyphenation and the minimum number of characters before the hyphen.
    /// The minimum number of characters after the hyphen will be set equal to the second value.
    case minimumWordLengthAndBefore(Int, Int)

    /// Sets all three values:
    /// - The minimum word length to allow hyphenation
    /// - The minimum number of characters before the hyphen
    /// - The minimum number of characters after the hyphen
    case all(Int, Int, Int)

    /// Sets minimum word length with auto values for before and/or after
    case mixed(wordLength: Int, before: HyphenLimit, after: HyphenLimit)

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .minimumWordLength(let length):
            return "\(length)"
        case .minimumWordLengthAndBefore(let length, let before):
            return "\(length) \(before)"
        case .all(let length, let before, let after):
            return "\(length) \(before) \(after)"
        case .mixed(let wordLength, let before, let after):
            let beforeStr = before.description
            let afterStr = after.description
            return "\(wordLength) \(beforeStr) \(afterStr)"
        case .global(let global):
            return global.description
        }
    }
}

/// Represents either an auto value or a specific integer value
/// for hyphenation limits
public enum HyphenLimit: Sendable, Hashable, CustomStringConvertible {
    case auto
    case value(Int)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .value(let val):
            return "\(val)"
        }
    }
}
