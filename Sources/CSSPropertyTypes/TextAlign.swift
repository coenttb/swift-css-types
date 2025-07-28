//
//  TextAlign.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-align` property sets the horizontal alignment of the inline-level
/// content inside a block element or table-cell box.
///
/// This means it works like vertical-align but in the horizontal direction. It affects
/// the alignment of text, images, and other inline elements.
///
/// - Note: The values `start` and `end` are calculated according to the text direction.
///         In left-to-right text, `start` aligns to the left. In right-to-left text,
///         `start` aligns to the right.
///
/// - SeeAlso: [MDN Web Docs on text-align](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align)
public enum TextAlign: Property {
    public static let property: String = "text-align"

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

    /// The inline contents are justified. Spaces out the content to line up its left and right
    /// edges to the left and right edges of the line box, except for the last line.
    case justify

    /// Similar to justify, but forces the last line to be justified as well.
    case justifyAll

    /// Similar to inherit, but the values start and end are calculated according
    /// to the parent's direction and are replaced by the appropriate left or right value.
    case matchParent

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
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
        case .justifyAll:
            return "justify-all"
        case .matchParent:
            return "match-parent"
        case .global(let global):
            return global.description
        }
    }
}
