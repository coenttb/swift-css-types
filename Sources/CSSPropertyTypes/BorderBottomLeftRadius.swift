import CSSTypeTypes
import Foundation

/// Represents the CSS `border-bottom-left-radius` property, which rounds the bottom-left corner of an element.
///
/// This property sets the radius of the bottom-left corner of an element's border box.
/// It can create rounded corners with a circular arc or an elliptical arc depending
/// on whether one or two values are specified.
///
/// Visual Reference:
/// ```
/// Circular corner:                    Elliptical corner:
/// ┌───────────────────────────┐       ┌───────────────────────────┐
/// │                           │       │                           │
/// │                           │       │                           │
/// │                           │       │                           │
/// │                           │       │                           │
/// └──────────────╭────────────┘       └─────────────────╮─────────┘
///   border-bottom-left-radius: 20px     border-bottom-left-radius: 40px 20px
/// ```
///
/// Example:
/// ```swift
/// // Create a circular corner with a 10px radius
/// .borderBottomLeftRadius(.radius(.px(10)))
///
/// // Create a circular corner with a percentage radius
/// .borderBottomLeftRadius(.radius(.percentage(25)))
///
/// // Create an elliptical corner (40px horizontal, 20px vertical)
/// .borderBottomLeftRadius(.elliptical(.px(40), .px(20)))
///
/// // Create an elliptical corner with mixed units
/// .borderBottomLeftRadius(.elliptical(.percentage(20), .px(15)))
///
/// // Use a global value
/// .borderBottomLeftRadius(.global(.inherit))
/// ```
///
/// - Note: When using percentages, the horizontal radius is a percentage of the element's width,
///         and the vertical radius is a percentage of the element's height.
///
/// - SeeAlso: [MDN Web Docs on border-bottom-left-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-left-radius)
public enum BorderBottomLeftRadius: Property {

  public static let property: String = "border-bottom-left-radius"

  /// A circular corner with a single radius
  case radius(LengthPercentage)

  /// An elliptical corner with horizontal and vertical radii
  case elliptical(LengthPercentage, LengthPercentage)

  /// Global CSS values
  case global(CSSTypeTypes.Global)
}

/// Convenience initializers for BorderBottomLeftRadius
extension BorderBottomLeftRadius {
  /// Creates a border-bottom-left-radius with a circular corner
  ///
  /// - Parameter radius: The radius of the corner
  public init(_ radius: LengthPercentage) {
    self = .radius(radius)
  }

  /// Creates a border-bottom-left-radius with an elliptical corner
  ///
  /// - Parameters:
  ///   - horizontal: The horizontal radius of the corner
  ///   - vertical: The vertical radius of the corner
  public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage) {
    self = .elliptical(horizontal, vertical)
  }

  /// Creates a border-bottom-left-radius with a circular corner
  ///
  /// - Parameter radius: The radius of the corner
  public init(radius: LengthPercentage) {
    self = .radius(radius)
  }

  /// Creates a border-bottom-left-radius with an elliptical corner
  ///
  /// - Parameters:
  ///   - horizontalRadius: The horizontal radius of the corner
  ///   - verticalRadius: The vertical radius of the corner
  public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
    self = .elliptical(horizontalRadius, verticalRadius)
  }
}

/// Support for LengthPercentageConvertible
extension BorderBottomLeftRadius: LengthPercentageConvertible {
  public static func lengthPercentage(
    _ value: CSSTypeTypes.LengthPercentage
  ) -> BorderBottomLeftRadius {
    .radius(value)
  }
}

/// Provides string conversion for CSS output
extension BorderBottomLeftRadius: CustomStringConvertible {
  /// Converts the border-bottom-left-radius to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-bottom-left-radius: 10px;
  /// border-bottom-left-radius: 25%;
  /// border-bottom-left-radius: 40px 20px;
  /// border-bottom-left-radius: 20% 15px;
  /// border-bottom-left-radius: inherit;
  /// ```
  public var description: String {
    switch self {
    case .radius(let radius):
      return radius.description
    case .elliptical(let horizontal, let vertical):
      return "\(horizontal.description) \(vertical.description)"
    case .global(let global):
      return global.description
    }
  }
}
