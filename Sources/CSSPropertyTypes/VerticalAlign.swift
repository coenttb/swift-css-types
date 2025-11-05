//
//  VerticalAlign.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `vertical-align` property sets vertical alignment of an inline, inline-block or table-cell box.
///
/// This property can be used in two contexts:
/// - To vertically align an inline-level element's box inside its containing line box
/// - To vertically align the content of a cell in a table
///
/// - Note: This property only applies to inline, inline-block and table-cell elements;
///         it cannot be used to vertically align block-level elements.
///
/// - SeeAlso: [MDN Web Docs on vertical-align](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align)
public enum VerticalAlign: Property {
    public static let property: String = "vertical-align"

    /// Parent-relative values

    /// Aligns the baseline of the element with the baseline of its parent.
    case baseline

    /// Aligns the baseline of the element with the subscript-baseline of its parent.
    case sub

    /// Aligns the baseline of the element with the superscript-baseline of its parent.
    case `super`

    /// Aligns the top of the element with the top of the parent element's font.
    case textTop

    /// Aligns the bottom of the element with the bottom of the parent element's font.
    case textBottom

    /// Aligns the middle of the element with the baseline plus half the x-height of the parent.
    case middle

    /// Line-relative values

    /// Aligns the top of the element and its descendants with the top of the entire line.
    case top

    /// Aligns the bottom of the element and its descendants with the bottom of the entire line.
    case bottom

    case lengthPercentage(LengthPercentage)

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .baseline:
            return "baseline"
        case .sub:
            return "sub"
        case .super:
            return "super"
        case .textTop:
            return "text-top"
        case .textBottom:
            return "text-bottom"
        case .middle:
            return "middle"
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let global):
            return global.description
        }
    }
}
