//
//  WebkitTapHighlightColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-webkit-tap-highlight-color` property sets the color of the highlight
/// that appears over a link or interactive element while it's being tapped on mobile devices.
///
/// This property is useful for customizing the visual feedback when users tap elements
/// on touch-enabled devices, particularly on iOS and Android WebKit browsers. It can also
/// be used to remove the default tap highlight entirely.
///
/// Example:
/// ```swift
/// // Set a red highlight color
/// .webkitTapHighlightColor(.color(.red))
///
/// // Set a semi-transparent blue highlight
/// .webkitTapHighlightColor(.color(.rgba(0, 0, 255, 0.5)))
///
/// // Make the highlight transparent (effectively removing it)
/// .webkitTapHighlightColor(.transparent)
/// ```
///
/// - Note: This is a non-standard WebKit-specific property primarily used for mobile browsers.
///         No standard alternative currently exists, though many developers choose to remove
///         the highlight with `transparent` and implement their own active state styles using
///         the `:active` pseudo-class.
///
/// - SeeAlso: [MDN Web Docs on -webkit-tap-highlight-color](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-tap-highlight-color)
public enum WebkitTapHighlightColor: Property, ColorConvertible {
  public static let property: String = "-webkit-tap-highlight-color"

  /// A specific color for the tap highlight
  case color(CSSTypeTypes.Color)

  /// Transparent highlight (effectively removing it)
  case transparent

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .color(let color):
      return color.description
    case .transparent:
      return "transparent"
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for WebkitTapHighlightColor
extension WebkitTapHighlightColor {
  /// Default value (black)
  public static let `default` = WebkitTapHighlightColor.color(.named(.black))

  /// Creates a semi-transparent highlight color
  ///
  /// - Parameters:
  ///   - color: The base color
  ///   - opacity: The opacity level (0.0-1.0)
  /// - Returns: A semi-transparent highlight color
  public static func alpha(_ color: CSSTypeTypes.Color, opacity: Double) -> WebkitTapHighlightColor
  {
    // Ensure opacity is between 0 and 1
    let clampedOpacity = max(0, min(1, opacity))

    // Create a new color with the specified opacity
    switch color {
    case .rgba(let r, let g, let b, _):
      return .color(.rgba(r, g, b, clampedOpacity))
    default:
      // For other color types, we'll need to convert or apply the alpha
      // This is a simplification; a real implementation might need more sophisticated color handling
      return .color(.rgba(0, 0, 0, clampedOpacity))
    }
  }
}
