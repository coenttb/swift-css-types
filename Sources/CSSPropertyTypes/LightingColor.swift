//
//  LightingColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The lighting-color CSS property defines the color of the light source for the 
/// <feDiffuseLighting> and <feSpecularLighting> SVG lighting filter primitives within an SVG <filter>.
///
/// Example:
/// ```swift
/// .lightingColor(.named(.white))        // lighting-color: white
/// .lightingColor(.hex("#f09"))          // lighting-color: #f09
/// .lightingColor(.rgb(255, 0, 0))       // lighting-color: rgb(255, 0, 0)
/// .lightingColor(.hsla(120, 75, 25, 0.6)) // lighting-color: hsla(120, 75%, 25%, 0.6)
/// ```
///
/// - Note: The lighting-color property only applies to <feDiffuseLighting> and <feSpecularLighting>
///         elements nested in an <svg>. It doesn't apply to other SVG, HTML, or pseudo-elements.
///
/// - SeeAlso: [MDN Web Docs on lighting-color](https://developer.mozilla.org/en-US/docs/Web/CSS/lighting-color)
public enum LightingColor: Property, ColorConvertible {
    public static let property: String = "lighting-color"
    /// A specific color value
    case color(CSSTypeTypes.Color)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .color(let color):
            return color.description
        case .global(let global):
            return global.description
        }
    }
}

/// Default lighting colors
extension LightingColor {
    /// White lighting color (default)
    public static let white: LightingColor = .color(.white)

    /// Red lighting color
    public static let red: LightingColor = .color(.red)

    /// Blue lighting color
    public static let blue: LightingColor = .color(.blue)

    /// Green lighting color
    public static let green: LightingColor = .color(.green)

    /// Current color value
    public static let currentColor: LightingColor = .color(.currentColor)
}
