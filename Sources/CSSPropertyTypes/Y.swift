//
//  Y.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `y` property defines the y-axis coordinate of the top left corner of an SVG element.
///
/// This property applies to SVG `<rect>`, `<image>`, `<foreignObject>`, and nested `<svg>` elements,
/// relative to the nearest `<svg>` ancestor's user coordinate system. If present, it overrides the 
/// element's `y` attribute.
///
/// - Note: The y property only applies to specific SVG elements nested in an `<svg>`.
///         It has no effect on outermost `<svg>` elements and does not apply to other SVG elements,
///         HTML elements, or pseudo-elements.
///
/// - SeeAlso: [MDN Web Docs on y](https://developer.mozilla.org/en-US/docs/Web/CSS/y)
public enum Y: Property, LengthPercentageConvertible {
    public static let property: String = "y"
    
    case lengthPercentage(LengthPercentage)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let global):
            return global.description
        }
    }
}
