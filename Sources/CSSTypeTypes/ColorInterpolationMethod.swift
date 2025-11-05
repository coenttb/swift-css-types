import Foundation

/// Represents CSS color interpolation methods used in gradients and color mixing.
///
/// The `ColorInterpolationMethod` data type specifies the color space and hue interpolation
/// method to use when interpolating between colors in functions like `color-mix()`
/// and gradients.
///
/// Example:
/// ```swift
/// .backgroundImage(.linearGradient(
///     .rectangular(.oklab),
///     .toRight,
///     [.blue, .red]
/// ))
/// ```
///
/// - Note: When no interpolation method is specified, the default is typically `oklab`,
///         which provides perceptually uniform color transitions.
///
/// - SeeAlso: [MDN Web Docs on color interpolation methods](https://developer.mozilla.org/en-US/docs/Web/CSS/color-interpolation-method)
public enum ColorInterpolationMethod: Sendable, Hashable {
    /// Rectangular color spaces for color interpolation
    public enum RectangularColorSpace: String, Sendable, Hashable, CustomStringConvertible {
        /// The standard sRGB color space
        case srgb = "srgb"

        /// The linearized sRGB color space
        case srgbLinear = "srgb-linear"

        /// The Display P3 wide-gamut color space
        case displayP3 = "display-p3"

        /// The Adobe RGB (1998) color space
        case a98rgb = "a98-rgb"

        /// The ProPhoto RGB color space
        case prophotoRgb = "prophoto-rgb"

        /// The Rec. 2020 color space for ultra-high-definition TV
        case rec2020 = "rec2020"

        /// The CIELAB color space
        case lab = "lab"

        /// The Oklab perceptual color space
        case oklab = "oklab"

        /// The CIE XYZ color space
        case xyz = "xyz"

        /// The CIE XYZ color space with D50 white point
        case xyzD50 = "xyz-d50"

        /// The CIE XYZ color space with D65 white point
        case xyzD65 = "xyz-d65"

        public var description: String { rawValue }
    }

    /// Polar color spaces for color interpolation
    public enum PolarColorSpace: String, Sendable, Hashable, CustomStringConvertible {
        /// The HSL (Hue, Saturation, Lightness) color space
        case hsl = "hsl"

        /// The HWB (Hue, Whiteness, Blackness) color space
        case hwb = "hwb"

        /// The LCH (Lightness, Chroma, Hue) color space
        case lch = "lch"

        /// The Oklch perceptual color space
        case oklch = "oklch"

        public var description: String { rawValue }
    }

    /// Hue interpolation methods for polar color spaces
    public enum HueInterpolationMethod: String, Sendable, Hashable, CustomStringConvertible {
        /// Follows the shorter arc around the color wheel (default)
        case shorter = "shorter hue"

        /// Follows the longer arc around the color wheel
        case longer = "longer hue"

        /// Interpolates in the direction of increasing hue values
        case increasing = "increasing hue"

        /// Interpolates in the direction of decreasing hue values
        case decreasing = "decreasing hue"

        public var description: String { rawValue }
    }

    /// Interpolation using a rectangular color space
    case rectangular(RectangularColorSpace)

    /// Interpolation using a polar color space with optional hue interpolation method
    case polar(PolarColorSpace, HueInterpolationMethod? = nil)

    /// Interpolation using a custom color profile
    case custom(CSSString)
}

/// Provides string conversion for CSS output
extension ColorInterpolationMethod: CustomStringConvertible {
    /// Converts the color interpolation method to its CSS string representation
    ///
    /// This method formats the interpolation method for use in CSS functions.
    public var description: String {
        switch self {
        case .rectangular(let space):
            return "in \(space)"
        case .polar(let space, let method):
            if let method = method {
                return "in \(space) \(method)"
            } else {
                return "in \(space)"
            }
        case .custom(let profile):
            return "in \(profile)"
        }
    }
}
