import Foundation

/// Represents a CSS algorithm used for interpolation between hue values.
///
/// The `HueInterpolationMethod` specifies how to find a midpoint between two hue values
/// based on a color wheel. It is used as a component of color interpolation methods,
/// particularly in gradient and animation contexts.
///
/// Example:
/// ```swift
/// .linearGradient(to: .right, in: .hsl, .shorter,  // Use shorter hue path
///                 colors: [.hex("#f60"), .hex("#ff0")])
/// ```
///
/// - Note: There are four possible algorithms to determine which arc is used
///         when interpolating between two hue angles on a color wheel.
///
/// - SeeAlso: [MDN Web Docs on hue-interpolation-method](https://developer.mozilla.org/en-US/docs/Web/CSS/hue-interpolation-method)
public enum HueInterpolationMethod: String, Sendable, Hashable {
  /// Use the shorter arc between the two hues on the color wheel.
  ///
  /// When the two hues are exactly opposite (180 degrees apart), this algorithm
  /// defaults to a clockwise direction if the first hue < second hue,
  /// or counterclockwise if the first hue > second hue.
  case shorter = "shorter hue"

  /// Use the longer arc between the two hues on the color wheel.
  ///
  /// This method takes the longer path around the color wheel, which can be
  /// useful for effects that require a broader color transition.
  case longer = "longer hue"

  /// Always use the clockwise arc regardless of which is shorter.
  ///
  /// This ensures consistent clockwise interpolation, which can be useful
  /// for predictable transitions in certain designs.
  case increasing = "increasing hue"

  /// Always use the counterclockwise arc regardless of which is shorter.
  ///
  /// This ensures consistent counterclockwise interpolation, which can be
  /// useful for predictable transitions in certain designs.
  case decreasing = "decreasing hue"
}

/// Provides string conversion for CSS output
extension HueInterpolationMethod: CustomStringConvertible {
  /// Converts the hue interpolation method to its CSS string representation
  public var description: String {
    return rawValue
  }
}
