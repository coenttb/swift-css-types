import CSSTypeTypes
import Foundation

/// The CSS aspect-ratio property allows you to define the desired width-to-height ratio
/// of an element's box.
///
/// This means that even if the parent container or viewport size changes, the browser will
/// adjust the element's dimensions to maintain the specified width-to-height ratio. The specified
/// aspect ratio is used in the calculation of auto sizes and some other layout functions.
///
/// Example:
/// ```swift
/// .aspectRatio(.auto)                      // aspect-ratio: auto
/// .aspectRatio(.ratio(16, 9))              // aspect-ratio: 16 / 9
/// .aspectRatio(.ratio(1))                  // aspect-ratio: 1
/// .aspectRatio(.autoWithFallback(.ratio(3, 2)))  // aspect-ratio: auto 3 / 2
/// ```
///
/// - Note: At least one of the box's sizes needs to be automatic in order for aspect-ratio
///         to have any effect.
///
/// - SeeAlso: [MDN Web Docs on aspect-ratio](https://developer.mozilla.org/en-US/docs/Web/CSS/aspect-ratio)
public enum AspectRatio: Property {
  public static let property: String = "aspect-ratio"

  /// Replaced elements with an intrinsic aspect ratio use that ratio
  case auto

  /// The box's preferred aspect ratio
  case ratio(Ratio)

  /// Auto with a fallback ratio for replaced elements
  case autoWithFallback(Ratio)

  /// Ratio with an auto fallback for replaced elements
  case ratioWithAuto(Ratio)

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Convenience initializer for a specific width-to-height ratio
  public static func ratio(_ width: Double, _ height: Double) -> AspectRatio {
    return .ratio(Ratio(width, height))
  }

  /// Convenience initializer for a specific width-to-height ratio with integer values
  public static func ratio(_ width: Int, _ height: Int) -> AspectRatio {
    return .ratio(Ratio(width, height))
  }

  /// Convenience initializer for a square aspect ratio
  public static func square() -> AspectRatio {
    return .ratio(Ratio.square)
  }

  /// Convenience initializer for a 16:9 widescreen aspect ratio
  public static func widescreen() -> AspectRatio {
    return .ratio(Ratio.widescreen)
  }
}

/// CSS Output conversion
extension AspectRatio: CustomStringConvertible {
  /// Converts the aspect ratio to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .ratio(let ratio):
      return ratio.description
    case .autoWithFallback(let ratio):
      return "auto \(ratio.description)"
    case .ratioWithAuto(let ratio):
      return "\(ratio.description) auto"
    case .global(let global):
      return global.description
    }
  }
}
