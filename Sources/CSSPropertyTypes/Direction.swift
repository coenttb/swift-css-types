//
//  Direction.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `direction` property sets the direction of text, table columns, and horizontal overflow.
///
/// Use `rtl` for languages written from right to left (like Hebrew or Arabic), and `ltr` for those
/// written from left to right (like English and most other languages).
///
/// - Warning: Where possible, authors are encouraged to avoid using the direction CSS property
///            and use the HTML dir global attribute instead.
///
/// - Note: The `direction` and `unicode-bidi` properties are the only two properties which are
///         not affected by the `all` shorthand property.
///
/// - SeeAlso: [MDN Web Docs on direction](https://developer.mozilla.org/en-US/docs/Web/CSS/direction)
public enum Direction: Property {
    public static let property: String = "direction"

    /// Text and other elements go from left to right. This is the default value.
    case ltr

    /// Text and other elements go from right to left.
    case rtl

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .ltr: return "ltr"
        case .rtl: return "rtl"
        case .global(let global): return global.description
        }
    }
}
