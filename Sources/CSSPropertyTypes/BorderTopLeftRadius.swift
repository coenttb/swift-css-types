import CSSTypeTypes
import Foundation

/// Represents the CSS `border-top-left-radius` property, which rounds the top-left corner of an element.
///
/// This property sets the radius of the top-left corner of an element's border box.
/// It can create rounded corners with a circular arc or an elliptical arc depending
/// on whether one or two values are specified.
///
/// Visual Reference:
/// ```
/// Circular corner:                    Elliptical corner:
/// ┌────────────╮────────────────┐       ┌─────────────╮─────────────┐
/// │                             │       │                           │
/// │                             │       │                           │
/// │                             │       │                           │
/// │                             │       │                           │
/// └─────────────────────────────┘       └───────────────────────────┘
///   border-top-left-radius: 20px         border-top-left-radius: 40px 20px
/// ```
///
/// Example:
/// ```swift
/// // Create a circular corner with a 10px radius
/// .borderTopLeftRadius(.radius(.px(10)))
///
/// // Create a circular corner with a percentage radius
/// .borderTopLeftRadius(.radius(.percentage(25)))
///
/// // Create an elliptical corner (40px horizontal, 20px vertical)
/// .borderTopLeftRadius(.elliptical(.px(40), .px(20)))
///
/// // Create an elliptical corner with mixed units
/// .borderTopLeftRadius(.elliptical(.percentage(20), .px(15)))
///
/// // Use a global value
/// .borderTopLeftRadius(.global(.inherit))
/// ```
///
/// - Note: When using percentages, the horizontal radius is a percentage of the element's width,
///         and the vertical radius is a percentage of the element's height.
///
/// - SeeAlso: [MDN Web Docs on border-top-left-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-left-radius)
public enum BorderTopLeftRadius: Property {

  public static let property: String = "border-top-left-radius"

  /// A single radius value for a circular corner
  case radius(LengthPercentage)

  /// Two radius values for an elliptical corner (horizontal, vertical)
  case elliptical(LengthPercentage, LengthPercentage)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-top-left-radius with the specified radius
  ///
  /// - Parameters:
  ///   - horizontal: The horizontal radius of the corner
  ///   - vertical: The vertical radius of the corner (optional, defaults to same as horizontal)
  public init(_ horizontal: LengthPercentage, _ vertical: LengthPercentage? = nil) {
    if let vertical = vertical {
      self = .elliptical(horizontal, vertical)
    } else {
      self = .radius(horizontal)
    }
  }

  /// Creates a border-top-left-radius with a circular corner
  ///
  /// - Parameter radius: The radius of the corner
  public init(radius: LengthPercentage) {
    self = .radius(radius)
  }

  /// Creates a border-top-left-radius with an elliptical corner
  ///
  /// - Parameters:
  ///   - horizontalRadius: The horizontal radius of the corner
  ///   - verticalRadius: The vertical radius of the corner
  public init(horizontalRadius: LengthPercentage, verticalRadius: LengthPercentage) {
    self = .elliptical(horizontalRadius, verticalRadius)
  }
}

/// Support for LengthPercentageConvertible
extension BorderTopLeftRadius: LengthPercentageConvertible {
  public static func lengthPercentage(_ value: LengthPercentage) -> BorderTopLeftRadius {
    .radius(value)
  }
}

/// Provides string conversion for CSS output
extension BorderTopLeftRadius: CustomStringConvertible {
  /// Converts the border-top-left-radius to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-top-left-radius: 10px;
  /// border-top-left-radius: 25%;
  /// border-top-left-radius: 40px 20px;
  /// border-top-left-radius: 20% 15px;
  /// border-top-left-radius: inherit;
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
