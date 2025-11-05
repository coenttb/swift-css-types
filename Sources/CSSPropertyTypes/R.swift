//
//  R.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `r` property defines the radius of a circle in SVG.
///
/// This property can only be used with SVG `<circle>` elements. If present, it overrides the
/// circle's `r` attribute. The value can be specified as a length or a percentage.
///
/// Example:
/// ```swift
/// .r(.px(30))            // r: 30px
/// .r(.percentage(20))    // r: 20%
/// ```
///
/// - Note: The `r` property only applies to `<circle>` elements nested in an `<svg>`. It doesn't
///   apply to other SVG elements, HTML elements, or pseudo-elements.
///
/// - SeeAlso: [MDN Web Docs on r](https://developer.mozilla.org/en-US/docs/Web/CSS/r)
public enum R: Property, LengthPercentageConvertible {
    public static let property: String = "r"

    /// A length-percentage value for the radius
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
