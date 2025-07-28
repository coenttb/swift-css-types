//
//  WebkitTextStrokeWidth.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `-webkit-text-stroke-width` property specifies the width of the stroke (outline) for text characters.
///
/// This property is often used in combination with `-webkit-text-stroke-color` to create outlined text
/// effects. You can also use the shorthand `-webkit-text-stroke` property to set both at once.
///
/// Example:
/// ```swift
/// // Predefined widths
/// .webkitTextStrokeWidth(.thin)
/// .webkitTextStrokeWidth(.medium)
/// .webkitTextStrokeWidth(.thick)
///
/// // Custom length values
/// .webkitTextStrokeWidth(.px(2))
/// .webkitTextStrokeWidth(.em(0.1))
/// ```
///
/// - Note: This is a non-standard WebKit property, but it's widely supported across modern browsers.
///         There's currently no standard CSS alternative for creating text outlines.
///
/// - SeeAlso: [MDN Web Docs on -webkit-text-stroke-width](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-text-stroke-width)
public enum WebkitTextStrokeWidth: Property, LengthConvertible {
    public static let property: String = "-webkit-text-stroke-width"

    /// Thin stroke width
    case thin

    /// Medium stroke width
    case medium

    /// Thick stroke width
    case thick

    /// Custom length value
    case length(Length)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    /// Creates a WebkitTextStrokeWidth from a Length
    ///
    /// - Parameter length: The stroke width as a length
    public init(_ length: Length) {
        self = .length(length)
    }

    public var description: String {
        switch self {
        case .thin:
            return "thin"
        case .medium:
            return "medium"
        case .thick:
            return "thick"
        case .length(let length):
            return length.description
        case .global(let global):
            return global.description
        }
    }
}
