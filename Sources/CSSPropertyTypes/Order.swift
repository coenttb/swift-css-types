import CSSTypeTypes
import Foundation

/// The CSS `order` property sets the order to lay out an item in a flex or grid container.
/// Items in a container are sorted by ascending order value and then by their source code order.
/// Items not given an explicit order value are assigned the default value of 0.
///
/// - Note: This property applies only to flex items and grid items.
/// - Warning: Using the order property will create a disconnect between the visual presentation
///           of content and DOM order. This may impact accessibility for users of assistive technology.
///
/// Example:
/// ```swift
/// .order(0)     // order: 0
/// .order(1)     // order: 1
/// .order(-1)    // order: -1
/// ```
///
/// - SeeAlso: [MDN Web Docs on order](https://developer.mozilla.org/en-US/docs/Web/CSS/order)
public enum Order: Property {
  public static let property: String = "order"

  /// An integer representing the ordinal group to be used by the item
  case value(Int)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension Order: CustomStringConvertible {
  /// Converts the order value to its CSS string representation
  public var description: String {
    switch self {
    case .value(let value):
      return "\(value)"

    case .global(let global):
      return global.description
    }
  }
}

/// Default value
extension Order {
  /// Default order value (0)
  public static let defaultValue: Order = .value(0)
}

extension Order: ExpressibleByIntegerLiteral {
  /// Creates an order value from an integer literal
  ///
  /// - Parameter value: The order value
  public init(integerLiteral value: Int) {
    self = .value(value)
  }
}
