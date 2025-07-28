import CSSTypeTypes
import Foundation

/// The CSS `font-smooth` property controls the application of anti-aliasing when fonts are rendered.
///
/// NOTE: This is a non-standard CSS property. Most browsers implement similar properties with vendor prefixes:
/// - WebKit: `-webkit-font-smoothing` (only works on macOS)
/// - Firefox: `-moz-osx-font-smoothing` (only works on macOS)
/// 
/// Example:
/// ```swift
/// .fontSmooth(.auto)           // font-smooth: auto
/// .fontSmooth(.never)          // font-smooth: never
/// .fontSmooth(.always)         // font-smooth: always
/// .fontSmooth(.size(.em(2)))   // font-smooth: 2em
/// .fontSmooth(.global(.inherit))  // font-smooth: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-smooth](https://developer.mozilla.org/en-US/docs/Web/CSS/font-smooth)
public enum FontSmooth: Property {
    public static let property: String = "font-smooth"

    /// Let the browser decide (default behavior)
    case auto

    /// Turn font smoothing off; display text with jagged sharp edges.
    case never

    /// Always apply font smoothing
    case always

    /// Size-based smoothing
    case size(Length)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .never:
            return "never"
        case .always:
            return "always"
        case .size(let length):
            return length.description
        case .global(let value):
            return value.description
        }
    }
}

/// WebKit-specific font smoothing property
public enum WebkitFontSmoothing: Property {
    public static let property: String = "-webkit-font-smoothing"

    /// Let the browser decide (Uses subpixel anti-aliasing when available; this is the default)
    case auto

    /// Turn font smoothing off; display text with jagged sharp edges.
    case none

    /// Smooth the font on the level of the pixel, as opposed to the subpixel.
    /// Switching from subpixel rendering to anti-aliasing for light text on dark backgrounds makes it look lighter.
    case antialiased

    /// On most non-retina displays, this will give the sharpest text.
    case subpixelAntialiased

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .antialiased:
            return "antialiased"
        case .subpixelAntialiased:
            return "subpixel-antialiased"
        case .global(let value):
            return value.description
        }
    }
}

/// Firefox-specific font smoothing property for macOS
public enum MozOsxFontSmoothing: Property {
    public static let property: String = "-moz-osx-font-smoothing"

    /// Allow the browser to select an optimization for font smoothing, typically grayscale.
    case auto

    /// Render text with grayscale anti-aliasing, as opposed to the subpixel.
    /// Switching from subpixel rendering to anti-aliasing for light text on dark backgrounds makes it look lighter.
    case grayscale

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .grayscale:
            return "grayscale"
        case .global(let value):
            return value.description
        }
    }
}
