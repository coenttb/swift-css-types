//
//  Hyphens.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `hyphens` property specifies how words should be hyphenated when text wraps across multiple lines.
///
/// It can prevent hyphenation entirely, hyphenate at manually-specified points within the text,
/// or let the browser automatically insert hyphens where appropriate.
///
/// - Note: Hyphenation rules are language-specific. In HTML, the language is determined by the `lang` attribute,
///         and browsers will hyphenate only if this attribute is present and the appropriate hyphenation
///         dictionary is available.
///
/// - Note: The rules defining how hyphenation is performed are not explicitly defined by the specification,
///         so the exact hyphenation may vary from browser to browser.
///
/// - SeeAlso: [MDN Web Docs on hyphens](https://developer.mozilla.org/en-US/docs/Web/CSS/hyphens)
public enum Hyphens: Property {

    public static let property: String = "hyphens"

    /// Words are not broken at line breaks, even if characters inside the words suggest line break points.
    /// Lines will only wrap at whitespace.
    case none

    /// Words are broken for line-wrapping only where characters inside the word suggest line break opportunities.
    /// For example, at soft hyphen characters (U+00AD) or hyphen characters (U+2010).
    case manual

    /// The browser is free to automatically break words at appropriate hyphenation points, following
    /// whatever rules it chooses. However, suggested line break opportunities will override automatic
    /// break point selection when present.
    case auto

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .manual:
            return "manual"
        case .auto:
            return "auto"
        case .global(let global):
            return global.description
        }
    }
}
