import CSSTypeTypes
import Foundation

/// The CSS `float` property places an element on the left or right side of its container,
/// allowing text and inline elements to wrap around it.
///
/// The element is removed from the normal flow of the page, though still remaining a part of the flow
/// (in contrast to absolute positioning).
///
/// Example:
/// ```swift
/// .float(.left)               // float: left
/// .float(.right)              // float: right
/// .float(.none)               // float: none
/// .float(.inlineStart)        // float: inline-start
/// .float(.global(.inherit))   // float: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on float](https://developer.mozilla.org/en-US/docs/Web/CSS/float)
public enum Float: Property {
  public static let property: String = "float"

  /// Default value. The element does not float
  case none

  /// The element floats on the left side of its containing block
  case left

  /// The element floats on the right side of its containing block
  case right

  /// The element floats on the start side of its containing block
  /// (left side with ltr scripts, right side with rtl scripts)
  case inlineStart

  /// The element floats on the end side of its containing block
  /// (right side with ltr scripts, left side with rtl scripts)
  case inlineEnd

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .left:
      return "left"
    case .right:
      return "right"
    case .inlineStart:
      return "inline-start"
    case .inlineEnd:
      return "inline-end"
    case .global(let value):
      return value.description
    }
  }
}
