//
//  WebkitTextStrokeColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `-webkit-text-stroke-color` property specifies the stroke (outline) color of characters of text.
/// If this property is not set, the value of the `color` property is used.
///
/// This property allows for creating text with colorful outlines, which can improve visibility
/// against various backgrounds or create interesting typographic effects.
///
/// Example:
/// ```swift
/// // Set a red stroke color
/// .webkitTextStrokeColor(.color(.red))
///
/// // Use a hex color
/// .webkitTextStrokeColor(.color(.hex("#e08ab4")))
///
/// // Use RGB color
/// .webkitTextStrokeColor(.color(.rgb(200, 100, 0)))
///
/// // Use the current text color
/// .webkitTextStrokeColor(.currentColor)
/// ```
///
/// - Note: This is a non-standard WebKit property, but it's widely supported across modern browsers.
///         It's commonly used in conjunction with `-webkit-text-stroke-width` to create outlined text,
///         or with the shorthand `-webkit-text-stroke` property.
///
/// - SeeAlso: [MDN Web Docs on -webkit-text-stroke-color](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-text-stroke-color)
public enum WebkitTextStrokeColor: Property, ColorConvertible {
    public static let property: String = "-webkit-text-stroke-color"
    
    /// A specific color for the text stroke
    case color(CSSTypeTypes.Color)
    
    /// Current text color
    case currentColor
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    /// Creates a WebkitTextStrokeColor from a Color
    ///
    /// - Parameter color: The stroke color
    public init(_ color: Color) {
        self = .color(color)
    }
    
    public var description: String {
        switch self {
        case .color(let color):
            return color.description
        case .currentColor:
            return "currentColor"
        case .global(let global):
            return global.description
        }
    }
}
