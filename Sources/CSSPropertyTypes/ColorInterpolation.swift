import CSSTypeTypes
import Foundation

/// The CSS `color-interpolation` property specifies which color space to use for color interpolation
/// in SVG elements like `<linearGradient>` and `<radialGradient>`.
///
/// Example:
/// ```swift
/// .colorInterpolation(.auto)       // color-interpolation: auto
/// .colorInterpolation(.sRGB)       // color-interpolation: sRGB
/// .colorInterpolation(.linearRGB)  // color-interpolation: linearRGB
/// ```
///
/// - Note: This property only applies to SVG elements.
///
/// - SeeAlso: [MDN Web Docs on color-interpolation](https://developer.mozilla.org/en-US/docs/Web/CSS/color-interpolation)
public enum ColorInterpolation: Property {
    public static let property: String = "color-interpolation"
    /// Indicates that the user agent can choose either the sRGB or linearRGB color space for interpolation.
    /// This means the author doesn't require interpolation to occur in a specific color space.
    case auto

    /// Indicates that color interpolation should occur in the sRGB color space.
    /// This is the default value if no color-interpolation property is set.
    case sRGB

    /// Indicates that color interpolation should occur in the linearized RGB color space
    /// as described in the sRGB specification.
    case linearRGB

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .sRGB: return "sRGB"
        case .linearRGB: return "linearRGB"
        case .global(let global): return global.description
        }
    }
}
