//
//  MozOrient.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-moz-orient` property specifies the orientation of the element to which it's applied.
///
/// This property is particularly useful for controlling the orientation of elements like `<progress>` and `<meter>`.
/// While it was originally a Mozilla-specific property, its behavior for progress and meter elements has
/// been standardized in CSS Grid Layout under the name `block-size` and `inline-size`.
///
/// Example:
/// ```swift
/// // Vertical orientation
/// .mozOrient(.vertical)
///
/// // Horizontal orientation
/// .mozOrient(.horizontal)
///
/// // Orient along the writing mode axis (default)
/// .mozOrient(.inline)
///
/// // Orient perpendicular to the writing mode axis
/// .mozOrient(.block)
/// ```
///
/// - Note: This is a non-standard Mozilla-specific property. While it works for `<progress>` and `<meter>` elements
///         in Firefox, it has no effect on most other elements or in other browsers. For cross-browser orientation
///         control, consider using standard layout properties like flexbox or grid.
///
/// - SeeAlso: [MDN Web Docs on -moz-orient](https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-orient)
public enum MozOrient: Property {
    public static let property: String = "-moz-orient"

    /// The element is rendered in the same direction as the axis of the text
    case inline

    /// The element is rendered perpendicular to the axis of the text
    case block

    /// The element is rendered horizontally regardless of text direction
    case horizontal

    /// The element is rendered vertically regardless of text direction
    case vertical

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .inline:
            return "inline"
        case .block:
            return "block"
        case .horizontal:
            return "horizontal"
        case .vertical:
            return "vertical"
        case .global(let global):
            return global.description
        }
    }
}
