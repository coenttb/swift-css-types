//
//  Quotes.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `quotes` property sets how the browser should render quotation marks.
///
/// This property defines the quotation marks that are automatically added to the HTML `<q>` element
/// or added using the `open-quotes` or `close-quotes` values of the CSS `content` property.
///
/// Example:
/// ```swift
/// .quotes(.none)                                // quotes: none
/// .quotes(.auto)                                // quotes: auto
/// .quotes(.strings([("\"", "\"")]))            // quotes: "\"" "\""
/// .quotes(.strings([("«", "»"), ("‹", "›")]))  // quotes: "«" "»" "‹" "›"
/// ```
///
/// - SeeAlso: [MDN Web Docs on quotes](https://developer.mozilla.org/en-US/docs/Web/CSS/quotes)
public enum Quotes: Property {
    public static let property: String = "quotes"

    /// No quotation marks are produced by `open-quote` and `close-quote`
    case none

    /// Language-appropriate quotation marks based on the `lang` attribute
    case auto

    /// Explicit list of opening and closing quotation pairs
    /// Each pair represents a level of nesting, with the first pair for the outermost quotes
    case strings([Pair])

    public struct Pair: Sendable, Hashable {
        let first: String
        let second: String

        public init(_ first: String, _ second: String) {
            self.first = first
            self.second = second
        }
    }

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .auto:
            return "auto"
        case .strings(let pairs):
            return pairs.flatMap { pair in ["\"\([pair.first])\"", "\"\(pair.second)\""] }.joined(
                separator: " "
            )
        case .global(let global):
            return global.description
        }
    }

    /// Create quotes with a single pair of quotation marks
    public static func pair(_ opening: String, _ closing: String) -> Quotes {
        .strings([.init(opening, closing)])
    }

    /// Create quotes with double English quotation marks
    public static var doubleQuotes: Quotes {
        .pair("\"", "\"")
    }

    /// Create quotes with single English quotation marks
    public static var singleQuotes: Quotes {
        .pair("'", "'")
    }

    /// Create quotes with English nested quotation style (double outside, single inside)
    public static var englishNestedQuotes: Quotes {
        .strings([.init("\"", "\""), .init("'", "'")])
    }

    /// Create quotes with French guillemets
    public static var frenchQuotes: Quotes {
        .pair("«", "»")
    }

    /// Create quotes with German quotation style
    public static var germanQuotes: Quotes {
        .pair("„", "\"")
    }
}
