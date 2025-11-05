import CSSTypeTypes
import Foundation

/// The CSS `color-interpolation-filters` property specifies the color space for imaging operations
/// performed via SVG filter effects.
///
/// This property differs from `color-interpolation` which controls standard color interpolation. It's
/// important to note that the default value of `color-interpolation` is `sRGB`, while the default for
/// `color-interpolation-filters` is `linearRGB`.
///
/// Example:
/// ```swift
/// .colorInterpolationFilters(.auto)       // color-interpolation-filters: auto
/// .colorInterpolationFilters(.sRGB)       // color-interpolation-filters: sRGB
/// .colorInterpolationFilters(.linearRGB)  // color-interpolation-filters: linearRGB
/// ```
///
/// - Note: This property only applies to SVG filter operations and has no effect on filter primitives
///         like `<feOffset>`, `<feImage>`, `<feTile>`, and `<feFlood>`. Instead, it applies to the
///         various filter effect elements like `<feBlend>`.
///
/// - SeeAlso: [MDN Web Docs on color-interpolation-filters](https://developer.mozilla.org/en-US/docs/Web/CSS/color-interpolation-filters)
public enum ColorInterpolationFilters: Property {
    public static let property: String = "color-interpolation-filters"
    /// Indicates that color interpolation should occur in the linearized RGB color space
    /// as described in the sRGB specification. This is the default property value.
    case linearRGB

    /// Indicates that color interpolation should occur in the gamma-encoded sRGB color space.
    case sRGB

    /// Indicates that the user agent can choose either the sRGB or linearRGB color space for interpolation.
    /// This means the author doesn't require interpolation to occur in a specific color space.
    case auto

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .linearRGB: return "linearRGB"
        case .sRGB: return "sRGB"
        case .auto: return "auto"
        case .global(let global): return global.description
        }
    }
}
