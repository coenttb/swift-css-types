import CSSTypeTypes
import Foundation

/// Represents the CSS `border-end-start-radius` property, which defines a logical border radius on an element,
/// which maps to a physical border radius depending on the element's writing-mode, direction, and text-orientation.
///
/// This property affects the corner between the block-end and the inline-start sides of the element.
/// For instance, in a horizontal-tb writing mode with ltr direction, it corresponds to the border-bottom-left-radius property.
///
/// Visual reference based on writing mode:
/// ```
/// horizontal-tb + ltr:          horizontal-tb + rtl:
/// ┌───────────────────┐         ┌───────────────────┐
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// └───────────────────┘         └───────────────────┘
///   ▲                                             ▲
/// border-end-start-radius               border-end-start-radius
///
/// vertical-rl:                vertical-lr:
/// ┌───────────────────┐       ┌───────────────────┐
/// │                   │       │                   │
/// │                   │       │                   │
/// │                   │       │                   │
/// │                   │       │                   │
/// └───────────────────┘       └───────────────────┘
///                     ▲       ▲
///      border-end-start-radius border-end-start-radius
/// ```
///
/// Example:
/// ```swift
/// // Set the border-end-start-radius to 5px
/// .borderEndStartRadius(.px(5))
///
/// // Set the border-end-start-radius to different horizontal and vertical radii
/// .borderEndStartRadius(.px(5), .px(10))
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-end-start-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-start-radius)
public enum BorderEndStartRadius: Property {

  public static let property: String = "border-end-start-radius"

  /// A single radius applied to both the horizontal and vertical dimensions
  case radius(LengthPercentage)

  /// Different radii for horizontal and vertical dimensions
  case horizontal_vertical(LengthPercentage, LengthPercentage)

  /// Global CSS values
  case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BorderEndStartRadius: CustomStringConvertible {
  /// Converts the border-end-start-radius to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-end-start-radius: 5px;
  /// border-end-start-radius: 5px 10px;
  /// ```
  public var description: String {
    switch self {
    case .radius(let radius):
      return radius.description
    case .horizontal_vertical(let horizontal, let vertical):
      return "\(horizontal) \(vertical)"
    case .global(let global):
      return global.description
    }
  }
}

extension BorderEndStartRadius: LengthPercentageConvertible {
  public static func lengthPercentage(
    _ value: CSSTypeTypes.LengthPercentage
  ) -> BorderEndStartRadius {
    .radius(value)
  }
}
