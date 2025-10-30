import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-type` property, which sets whether an SVG mask element uses luminance or alpha values.
///
/// This property applies to SVG `<mask>` elements and determines how the mask content is interpreted when applied.
/// It can be overridden by the `mask-mode` property, which applies to the element where the mask is used.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │       ■■■■■■■■■           │  │       ■■■■■■■■■           │
/// │                           │  │                           │
/// │      luminance mode       │  │       alpha mode          │
/// │    (uses brightness)      │  │    (uses transparency)    │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Use luminance values of the mask content (default)
/// .maskType(.luminance)
///
/// // Use alpha values of the mask content
/// .maskType(.alpha)
/// ```
///
/// - Note: Alpha masks are generally faster to render than luminance masks.
///
/// - SeeAlso: [MDN Web Docs on mask-type](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-type)
public enum MaskType: Property {
  public static let property: String = "mask-type"

  /// Use luminance (brightness) values of the mask content
  case luminance

  /// Use alpha (transparency) values of the mask content
  case alpha

  /// Global CSS values
  case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension MaskType: CustomStringConvertible {
  /// Converts the mask-type value to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// mask-type: luminance;
  /// mask-type: alpha;
  /// ```
  public var description: String {
    switch self {
    case .luminance:
      return "luminance"
    case .alpha:
      return "alpha"
    case .global(let global):
      return global.description
    }
  }
}

/// Default value and convenience methods
extension MaskType {
  /// The default value for mask-type (`luminance`)
  public static let `default` = MaskType.luminance
}
