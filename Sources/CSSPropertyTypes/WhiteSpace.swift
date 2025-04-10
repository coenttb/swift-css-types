//
//  WhiteSpace.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `white-space` property sets how white space inside an element is handled.
///
/// This property specifies two things:
/// - Whether and how white space is collapsed
/// - Whether and how lines wrap
///
/// - Note: To make words break within themselves, use `overflow-wrap`, `word-break`, or `hyphens` instead.
///
/// - SeeAlso: [MDN Web Docs on white-space](https://developer.mozilla.org/en-US/docs/Web/CSS/white-space)
public enum WhiteSpace: Property {
    public static let property: String = "white-space"
    /// Sequences of white space are collapsed.
    /// Newline characters in the source are handled the same as other white spaces.
    /// Lines are broken as necessary to fill line boxes.
    case normal
    
    /// Sequences of white space are preserved.
    /// Lines are only broken at newline characters in the source and at <br> elements.
    case pre
    
    /// Sequences of white space are preserved.
    /// Lines are broken at newline characters, at <br>, and as necessary to fill line boxes.
    case preWrap
    
    /// Sequences of white space are collapsed.
    /// Lines are broken at newline characters, at <br>, and as necessary to fill line boxes.
    case preLine
    
    /// Collapses white space and forces inline text to stay on the same line until a <br> is encountered.
    case nowrap
    
    /// Similar to pre-wrap, but with additional behavior:
    /// - Any preserved white space always takes space, including at line ends
    /// - Line breaks can occur after any preserved white space character
    /// - Preserved spaces affect intrinsic sizes
    case breakSpaces
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .pre:
            return "pre"
        case .preWrap:
            return "pre-wrap"
        case .preLine:
            return "pre-line"
        case .nowrap:
            return "nowrap"
        case .breakSpaces:
            return "break-spaces"
        case .global(let global):
            return global.description
        }
    }
}
