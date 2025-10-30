import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-border-source` property, which specifies the source image
/// used to create an element's mask border.
///
/// This property defines what image to use as a mask for the element's border.
/// The mask will hide parts of the element's border and content according to the alpha
/// channel of the specified image.
///
/// Example:
/// ```swift
/// // No mask border
/// .maskBorderSource(.none)
///
/// // Use an image as mask border source
/// .maskBorderSource(.url("border-mask.png"))
///
/// // Use a gradient as mask border source
/// .maskBorderSource(.linearGradient("45deg, black, transparent"))
/// ```
///
/// - Note: The `mask-border-source` property is used with other mask-border properties:
///         `mask-border-slice`, `mask-border-width`, `mask-border-outset`, `mask-border-repeat`,
///         and `mask-border-mode` to create complete mask borders.
///
/// - SeeAlso: [MDN Web Docs on mask-border-source](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-source)
public enum MaskBorderSource: Property {
  public static let property: String = "mask-border-source"

  /// No mask border source
  case none

  /// Use a URL to an image as mask border source
  case url(Url)

  /// Use a linear gradient as mask border source
  case linearGradient(CSSString)

  /// Use a radial gradient as mask border source
  case radialGradient(CSSString)

  /// Use a conic gradient as mask border source
  case conicGradient(CSSString)

  /// Use a repeating linear gradient as mask border source
  case repeatingLinearGradient(CSSString)

  /// Use a repeating radial gradient as mask border source
  case repeatingRadialGradient(CSSString)

  /// Use a repeating conic gradient as mask border source
  case repeatingConicGradient(CSSString)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Default value (none)
  public static let `default` = MaskBorderSource.none
}

/// Provides string conversion for CSS output
extension MaskBorderSource: CustomStringConvertible {
  /// Converts the mask-border-source to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// mask-border-source: none;
  /// mask-border-source: url("border-mask.png");
  /// mask-border-source: linear-gradient(45deg, black, transparent);
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
