//
//  StrokeLinecap.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `stroke-linecap` property defines the shape to be used at the end of open subpaths
/// of SVG elements' unclosed strokes. If present, it overrides the element's stroke-linecap attribute.
///
/// This property applies to any SVG shape that can have unclosed strokes as well as text-content elements,
/// but as an inherited property, it may be applied to elements such as `<g>` and still have the intended
/// effect on descendant elements.
///
/// Example:
/// ```swift
/// .strokeLinecap(.butt)        // stroke-linecap: butt
/// .strokeLinecap(.round)       // stroke-linecap: round
/// .strokeLinecap(.square)      // stroke-linecap: square
/// ```
///
/// - Note: The `butt` value (default) means strokes end exactly at their endpoints, while `round` and
///        `square` values extend the stroke beyond its endpoints by half the stroke width.
///
/// - SeeAlso: [MDN Web Docs on stroke-linecap](https://developer.mozilla.org/en-US/docs/Web/CSS/stroke-linecap)
public enum StrokeLinecap: Property {
    public static let property: String = "stroke-linecap"
    /// The stroke ends flat at its endpoints (default)
    case butt

    /// The stroke ends with a semicircular shape whose diameter equals the stroke width
    case round

    /// The stroke ends with a square shape extending half the stroke width beyond the endpoint
    case square

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .butt:
            return "butt"
        case .round:
            return "round"
        case .square:
            return "square"
        case .global(let global):
            return global.description
        }
    }
}
