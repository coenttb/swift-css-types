//
//  TextJustify.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-justify` property sets what type of justification should be applied
/// to text when `text-align: justify` is set on an element.
///
/// This is particularly important for international text, as different languages have
/// different justification conventions.
///
/// - SeeAlso: [MDN Web Docs on text-justify](https://developer.mozilla.org/en-US/docs/Web/CSS/text-justify)
public enum TextJustify: Property {
    public static let property: String = "text-justify"

    /// Text justification is turned off. This has the same effect as not setting
    /// text-align to justify at all.
    case none

    /// The browser chooses the best type of justification for the current situation
    /// based on a balance between performance and quality, but also on what is most
    /// appropriate for the language of the text (e.g., English, CJK languages, etc.).
    case auto

    /// The text is justified by adding space between words (effectively varying word-spacing),
    /// which is most appropriate for languages that separate words using spaces,
    /// like English or Korean.
    case interWord

    /// The text is justified by adding space between characters (effectively varying letter-spacing),
    /// which is most appropriate for languages like Japanese.
    case interCharacter

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none: return "none"
        case .auto: return "auto"
        case .interWord: return "inter-word"
        case .interCharacter: return "inter-character"
        case .global(let global): return global.description
        }
    }
}
