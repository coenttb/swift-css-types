import CSSTypeTypes
import Foundation

/// Represents the CSS `border-image-source` property, which specifies the source image
/// used to create an element's border image.
///
/// This property defines what image to use instead of the standard border style. When
/// specified, the image replaces the element's border style set with `border-style`.
///
/// Visual Reference:
/// ```
/// Without border-image-source:     With border-image-source:
/// ┌───────────────────┐            ┌┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┐
/// │                   │            ┋                 ┋
/// │                   │            ┋                 ┋
/// │                   │            ┋                 ┋
/// │                   │            ┋                 ┋
/// └───────────────────┘            └┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┘
///  Standard border                  Border from image source
/// ```
///
/// Example:
/// ```swift
/// // No border image (use border-style instead)
/// .borderImageSource(.none)
///
/// // Use an image as border source
/// .borderImageSource(.url("border-image.png"))
///
/// // Use a gradient as border source
/// .borderImageSource(.linearGradient("45deg, red, blue"))
/// ```
///
/// - Note: The `border-image-source` property is used with other border-image properties:
///         `border-image-slice`, `border-image-width`, `border-image-outset`, and
///         `border-image-repeat` to create complete border images.
///
/// - SeeAlso: [MDN Web Docs on border-image-source](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-source)
public enum BorderImageSource: Property {

    public static let property: String = "border-image-source"

    /// No border image (use border-style instead)
    case none

    /// Use a URL to an image as border source
    case url(Url)

    /// Use a linear gradient as border source
    case linearGradient(CSSString)

    /// Use a radial gradient as border source
    case radialGradient(CSSString)

    /// Use a conic gradient as border source
    case conicGradient(CSSString)

    /// Use a repeating linear gradient as border source
    case repeatingLinearGradient(CSSString)

    /// Use a repeating radial gradient as border source
    case repeatingRadialGradient(CSSString)

    /// Use a repeating conic gradient as border source
    case repeatingConicGradient(CSSString)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Default value (none)
    public static let `default` = BorderImageSource.none
}

/// Provides string conversion for CSS output
extension BorderImageSource: CustomStringConvertible {
    /// Converts the border-image-source to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-image-source: none;
    /// border-image-source: url("image.png");
    /// border-image-source: linear-gradient(45deg, red, blue);
    /// ```
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .url(let path):
            // If path already contains url(), use it as is
            if path.value.hasPrefix("url(") {
                return path.description
            }
            // If path contains quotes, use it as is inside url()
            if path.value.contains("\"") || path.value.contains("'") {
                return "url(\(path))"
            }
            // Otherwise, add quotes
            return "url(\"\(path)\")"
        case .linearGradient(let value):
            return "linear-gradient(\(value))"
        case .radialGradient(let value):
            return "radial-gradient(\(value))"
        case .conicGradient(let value):
            return "conic-gradient(\(value))"
        case .repeatingLinearGradient(let value):
            return "repeating-linear-gradient(\(value))"
        case .repeatingRadialGradient(let value):
            return "repeating-radial-gradient(\(value))"
        case .repeatingConicGradient(let value):
            return "repeating-conic-gradient(\(value))"
        case .global(let global):
            return global.description
        }
    }
}
