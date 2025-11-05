//
//  TextBox.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-box` property is a shorthand that combines `text-box-trim` and `text-box-edge`,
/// which together specify the amount of space to trim from block edges of a text element's container.
///
/// Vertical spacing differs between fonts, making consistent typesetting historically challenging
/// on the web. The text-box shorthand makes it easier to control both which edges to trim and how
/// much space to trim from each edge.
///
/// Example:
/// ```swift
/// .textBox(.normal)                            // text-box: normal
/// .textBox(.trimBoth, .text)                   // text-box: trim-both text
/// .textBox(.trimEnd, .capAlphabetic)           // text-box: trim-end cap alphabetic
/// ```
///
/// - Note: If text-box-trim is omitted, it is set to trim-both.
///         If text-box-edge is omitted, it is set to auto.
///         The 'normal' value is equivalent to 'none auto'.
///
/// - SeeAlso: [MDN Web Docs on text-box](https://developer.mozilla.org/en-US/docs/Web/CSS/text-box)
public enum TextBox: Property {
    public static let property: String = "text-box"

    /// Default value, equivalent to text-box: none auto;
    case normal

    /// Combines text-box-trim and text-box-edge properties
    case trim(TextBoxTrim, TextBoxEdge)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    /// Convenience initializer for text-box-trim and text-box-edge values
    public init(_ trim: TextBoxTrim, _ edge: TextBoxEdge = .auto) {
        self = .trim(trim, edge)
    }

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .trim(let trimValue, let edgeValue):
            return "\(trimValue) \(edgeValue)"
        case .global(let global):
            return global.description
        }
    }
}
