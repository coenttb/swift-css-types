//
//  X.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `x` property defines the x-axis coordinate of the top left corner of an SVG element.
///
/// This property applies to SVG `<rect>`, `<image>`, `<foreignObject>`, and nested `<svg>` elements,
/// relative to the nearest `<svg>` ancestor's user coordinate system. If present, it overrides the 
/// element's `x` attribute.
///
/// - Note: The x property only applies to specific SVG elements nested in an `<svg>`.
///         It has no effect on outermost `<svg>` elements and does not apply to other SVG elements,
///         HTML elements, or pseudo-elements.
///
/// - SeeAlso: [MDN Web Docs on x](https://developer.mozilla.org/en-US/docs/Web/CSS/x)
public enum X: Property, LengthPercentageConvertible {
    public static let property: String = "x"
    
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
