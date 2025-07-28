//
//  WordBreak.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `word-break` property sets whether line breaks appear wherever the text would otherwise overflow its content box.
///
/// This property is used to specify how overflowing words should be handled across different languages.
///
/// - SeeAlso: [MDN Web Docs on word-break](https://developer.mozilla.org/en-US/docs/Web/CSS/word-break)
public enum WordBreak: Property {
    public static let property: String = "word-break"

    /// Use the default line break rule.
    case normal

    /// To prevent overflow, word breaks should be inserted between any two characters 
    /// (excluding Chinese/Japanese/Korean text).
    case breakAll

    /// Word breaks should not be used for Chinese/Japanese/Korean (CJK) text.
    /// Non-CJK text behavior is the same as for normal.
    case keepAll

    /// Has the same effect as word-break: normal except that language-specific analysis 
    /// is performed to improve word breaks by not placing them in the middle of natural phrases.
    /// - Note: This is an experimental value and may not be supported in all browsers.
    case autoPhrase

    /// Has the same effect as overflow-wrap: anywhere combined with word-break: normal,
    /// regardless of the actual value of the overflow-wrap property.
    /// - Note: This value is deprecated. Use `overflow-wrap: break-word` instead.
    case breakWord

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .breakAll:
            return "break-all"
        case .keepAll:
            return "keep-all"
        case .autoPhrase:
            return "auto-phrase"
        case .breakWord:
            return "break-word"
        case .global(let global):
            return global.description
        }
    }
}
