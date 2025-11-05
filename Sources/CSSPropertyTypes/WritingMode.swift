//
//  WritingMode.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `writing-mode` property sets whether lines of text are laid out horizontally or vertically,
/// as well as the direction in which blocks progress.
///
/// This property specifies the block flow direction, which is the direction in which block-level containers
/// are stacked, and the direction in which inline-level content flows within a block container.
/// When set for an entire document, it should be set on the root element (html element for HTML documents).
///
/// - SeeAlso: [MDN Web Docs on writing-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/writing-mode)
public enum WritingMode: Property {
    public static let property: String = "writing-mode"

    /// For ltr scripts, content flows horizontally from left to right.
    /// For rtl scripts, content flows horizontally from right to left.
    /// The next horizontal line is positioned below the previous line.
    case horizontalTb

    /// For ltr scripts, content flows vertically from top to bottom, and the next vertical line
    /// is positioned to the right of the previous line.
    /// For rtl scripts, content flows vertically from bottom to top, and the next vertical line
    /// is positioned to the left of the previous line.
    case verticalLr

    /// For ltr scripts, content flows vertically from top to bottom, and the next vertical line
    /// is positioned to the left of the previous line.
    /// For rtl scripts, content flows vertically from bottom to top, and the next vertical line
    /// is positioned to the right of the previous line.
    case verticalRl

    /// For ltr scripts, content flows vertically from bottom to top.
    /// For rtl scripts, content flows vertically from top to bottom.
    /// All the glyphs, even those in vertical scripts, are set sideways toward the left.
    case sidewaysLr

    /// For ltr scripts, content flows vertically from top to bottom.
    /// For rtl scripts, content flows vertically from bottom to top.
    /// All the glyphs, even those in vertical scripts, are set sideways toward the right.
    case sidewaysRl

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .horizontalTb:
            return "horizontal-tb"
        case .verticalLr:
            return "vertical-lr"
        case .verticalRl:
            return "vertical-rl"
        case .sidewaysLr:
            return "sideways-lr"
        case .sidewaysRl:
            return "sideways-rl"
        case .global(let global):
            return global.description
        }
    }
}
