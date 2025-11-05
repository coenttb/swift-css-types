import CSSTypeTypes
import Foundation

/// The CSS `mix-blend-mode` property sets how an element's content should blend with the content
/// of the element's parent and the element's background.
///
/// Example:
/// ```swift
/// .mixBlendMode(.normal)      // mix-blend-mode: normal
/// .mixBlendMode(.multiply)    // mix-blend-mode: multiply
/// .mixBlendMode(.screen)      // mix-blend-mode: screen
/// .mixBlendMode(.overlay)     // mix-blend-mode: overlay
/// ```
///
/// - Note: Using mix-blend-mode with a value other than normal automatically creates a new stacking context.
/// - Note: To isolate blending so it doesn't affect the background, use `isolation: isolate` on a parent element.
///
/// - SeeAlso: [MDN Web Docs on mix-blend-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/mix-blend-mode)
public enum MixBlendMode: Property {

    public static let property: String = "mix-blend-mode"

    // Standard blend modes
    /// The final color is the top color, regardless of the bottom color
    case normal

    /// Multiplies the top and bottom colors
    case multiply

    /// Inverts colors, multiplies them, and inverts that value
    case screen

    /// Multiplies if the bottom color is darker, screens if the bottom color is lighter
    case overlay

    /// Selects the darkest value from each color channel
    case darken

    /// Selects the lightest value from each color channel
    case lighten

    /// Divides the bottom color by the inverse of the top color
    case colorDodge

    /// Inverts the bottom color, divides by the top color, and inverts again
    case colorBurn

    /// Multiplies if the top color is darker, screens if the top color is lighter
    case hardLight

    /// Similar to hard-light, but softer
    case softLight

    /// Subtracts the darker of the two colors from the lighter one
    case difference

    /// Similar to difference, but with less contrast
    case exclusion

    /// Applies the hue of the top color with saturation and luminosity of the bottom color
    case hue

    /// Applies the saturation of the top color with hue and luminosity of the bottom color
    case saturation

    /// Applies the hue and saturation of the top color with luminosity of the bottom color
    case color

    /// Applies the luminosity of the top color with hue and saturation of the bottom color
    case luminosity

    // Additional compositing operators
    /// Blending using the plus-darker compositing operator
    case plusDarker

    /// Blending using the plus-lighter compositing operator
    case plusLighter

    case global(Global)
}

/// CSS Output conversion
extension MixBlendMode: CustomStringConvertible {
    /// Converts the mix-blend-mode value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            "normal"
        case .multiply:
            "multiply"
        case .screen:
            "screen"
        case .overlay:
            "overlay"
        case .darken:
            "darken"
        case .lighten:
            "lighten"
        case .colorDodge:
            "color-dodge"
        case .colorBurn:
            "color-burn"
        case .hardLight:
            "hard-light"
        case .softLight:
            "soft-light"
        case .difference:
            "difference"
        case .exclusion:
            "exclusion"
        case .hue:
            "hue"
        case .saturation:
            "saturation"
        case .color:
            "color"
        case .luminosity:
            "luminosity"
        case .plusDarker:
            "plus-darker"
        case .plusLighter:
            "plus-lighter"
        case .global(let global):
            global.description
        }
    }
}

/// Convenience initializer from BlendMode type
extension MixBlendMode {
    /// Creates a MixBlendMode from a BlendMode value
    ///
    /// - Parameter blendMode: The BlendMode value to convert
    public init(_ blendMode: BlendMode) {
        switch blendMode {
        case .normal: self = .normal
        case .multiply: self = .multiply
        case .screen: self = .screen
        case .overlay: self = .overlay
        case .darken: self = .darken
        case .lighten: self = .lighten
        case .colorDodge: self = .colorDodge
        case .colorBurn: self = .colorBurn
        case .hardLight: self = .hardLight
        case .softLight: self = .softLight
        case .difference: self = .difference
        case .exclusion: self = .exclusion
        case .hue: self = .hue
        case .saturation: self = .saturation
        case .color: self = .color
        case .luminosity: self = .luminosity
        }
    }
}
