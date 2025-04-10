//
//  TextBoxTrim.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `text-box-trim` property specifies which of the over and under edges of text content 
/// to trim from a text element's block container.
///
/// Vertical spacing differs between fonts, making consistent typesetting historically challenging 
/// on the web. The text-box-trim property — along with its counterpart property text-box-edge, 
/// which specifies how much space to trim — makes consistent vertical spacing of text easier to achieve.
///
/// Example:
/// ```swift
/// .textBoxTrim(.none)               // text-box-trim: none
/// .textBoxTrim(.trimBoth)           // text-box-trim: trim-both
/// .textBoxTrim(.trimStart)          // text-box-trim: trim-start
/// .textBoxTrim(.trimEnd)            // text-box-trim: trim-end
/// ```
///
/// - Note: The `text-box` shorthand property can be used to specify both the text-box-trim
///         and text-box-edge values in a single declaration.
///
/// - SeeAlso: [MDN Web Docs on text-box-trim](https://developer.mozilla.org/en-US/docs/Web/CSS/text-box-trim)
public enum TextBoxTrim: Property {
    public static let property: String = "text-box-trim"
    
    /// No space is trimmed from the text.
    case none
    
    /// The start (over) and end (under) edges are both trimmed.
    case trimBoth
    
    /// The start (over) edge is trimmed.
    case trimStart
    
    /// The end (under) edge is trimmed.
    case trimEnd
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .trimBoth:
            return "trim-both"
        case .trimStart:
            return "trim-start"
        case .trimEnd:
            return "trim-end"
        case .global(let global):
            return global.description
        }
    }
}
