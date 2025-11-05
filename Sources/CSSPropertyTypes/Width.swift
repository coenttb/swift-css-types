//
//  Width.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `width` property sets an element's width.
///
/// By default, it sets the width of the content area, but if `box-sizing` is set to `border-box`,
/// it sets the width of the border area.
///
/// The specified value of width applies to the content area as long as it remains within
/// the values defined by `min-width` and `max-width`. If the value for width is less than the value
/// for `min-width`, then `min-width` overrides width. If the value for width is greater than the value
/// for `max-width`, then `max-width` overrides width.
///
/// - Note: As a geometric property, width also applies to SVG elements like `<svg>`, `<rect>`,
///         `<image>`, and `<foreignObject>`.
///
/// - SeeAlso: [MDN Web Docs on width](https://developer.mozilla.org/en-US/docs/Web/CSS/width)
public enum Width: Property, LengthPercentageConvertible {
    public static let property: String = "width"

    case lengthPercentage(LengthPercentage)

    /// The browser calculates and selects a width for the specified element
    case auto

    /// The intrinsic preferred width
    case maxContent

    /// The intrinsic minimum width
    case minContent

    /// Uses the available space, but not more than max-content
    case fitContent

    /// Uses the fit-content formula with the available space replaced by the specified argument
    case fitContentLength(LengthPercentage)

    /// Sets the width of the element's margin box to the width of its containing block
    case stretch

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .auto:
            return "auto"
        case .maxContent:
            return "max-content"
        case .minContent:
            return "min-content"
        case .fitContent:
            return "fit-content"
        case .fitContentLength(let lengthPercentage):
            return "fit-content(\(lengthPercentage.description))"
        case .stretch:
            return "stretch"
        case .global(let global):
            return global.description
        }
    }
}
