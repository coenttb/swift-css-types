//
//  TextAlignLast.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `text-align-last` property sets how the last line of a block or a line,
/// right before a forced line break, is aligned.
///
/// This is particularly useful for controlling the alignment of the last line in justified
/// text, where the default behavior may result in uneven spacing.
///
/// - SeeAlso: [MDN Web Docs on text-align-last](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align-last)
public enum TextAlignLast: Property {
    public static let property: String = "text-align-last"
    
    /// The affected line is aligned per the value of text-align, unless text-align is justify,
    /// in which case the effect is the same as setting text-align-last to start.
    case auto
    
    /// The same as left if direction is left-to-right and right if direction is right-to-left.
    case start
    
    /// The same as right if direction is left-to-right and left if direction is right-to-left.
    case end
    
    /// The inline contents are aligned to the left edge of the line box.
    case left
    
    /// The inline contents are aligned to the right edge of the line box.
    case right
    
    /// The inline contents are centered within the line box.
    case center
    
    /// The text is justified. Text should line up their left and right edges to the
    /// left and right content edges of the paragraph.
    case justify
    
    /// Similar to inherit, but the values start and end are calculated according
    /// to the parent's direction and are replaced by the appropriate left or right value.
    case matchParent
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .start:
            return "start"
        case .end:
            return "end"
        case .left:
            return "left"
        case .right:
            return "right"
        case .center:
            return "center"
        case .justify:
            return "justify"
        case .matchParent:
            return "match-parent"
        case .global(let global):
            return global.description
        }
    }
}
