//
//  FontLanguageOverride.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `font-language-override` property controls the use of language-specific glyphs in a typeface.
///
/// By default, HTML's lang attribute tells browsers to display glyphs designed specifically for that language.
/// The font-language-override property lets you override the typeface behavior for a specific language.
/// This is useful when the typeface you're using lacks proper support for the language.
///
/// For example, if a typeface doesn't have proper rules for the Azeri language, you can force the font
/// to use Turkish glyphs, which follow similar rules.
///
/// - SeeAlso: [MDN Web Docs on font-language-override](https://developer.mozilla.org/en-US/docs/Web/CSS/font-language-override)
public enum FontLanguageOverride: Property {
    public static let property: String = "font-language-override"

    /// Tells the browser to use font glyphs that are appropriate for the language
    /// specified by the lang attribute. This is the default value.
    case normal

    /// Tells the browser to use font glyphs that are appropriate for the language
    /// specified by the string. The string must match a language tag found in the
    /// OpenType language system, e.g., "ENG" for English, "KOR" for Korean.
    case language(CSSString)

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .language(let langTag):
            return langTag.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common language codes
extension FontLanguageOverride {
    /// Use English glyphs ("ENG")
    public static var english: FontLanguageOverride {
        .language(.init("ENG"))
    }

    /// Use Turkish glyphs ("TRK")
    public static var turkish: FontLanguageOverride {
        .language(.init("TRK"))
    }

    /// Use Korean glyphs ("KOR")
    public static var korean: FontLanguageOverride {
        .language(.init("KOR"))
    }

    /// Use Danish glyphs ("DAN")
    public static var danish: FontLanguageOverride {
        .language(.init("DAN"))
    }

    /// Use Japanese glyphs ("JAN")
    public static var japanese: FontLanguageOverride {
        .language(.init("JAN"))
    }
}
