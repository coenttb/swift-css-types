import CSSTypeTypes
import Foundation

/// Represents the CSS `border-left-color` property, which sets the color of the left border.
///
/// This property sets the color for the left border of an element.
///
/// Visual Reference:
/// ```
/// ┌─────┬───────────────────────┐
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// │     │                       │
/// └─────┴───────────────────────┘
///   ↑
///   border-left-color
/// ```
///
/// Example:
/// ```swift
/// // Set the left border color to red
/// .borderLeftColor(.red)
///
/// // Set the left border color to a semi-transparent blue
/// .borderLeftColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the left border color to a hex value
/// .borderLeftColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderLeftColor(.currentColor)
/// ```
///
/// - Note: For the border to be visible, you must also set `border-left-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-left-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-color)
public enum BorderLeftColor: Property, ColorConvertible {

  public static let property: String = "border-left-color"

  /// A specific color for the left border
  case color(CSSTypeTypes.Color)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-left-color with a specific color
  ///
  /// - Parameter color: The color for the left border
  public init(_ color: CSSTypeTypes.Color) {
    self = .color(color)
  }
}

/// Provides string conversion for CSS output
extension BorderLeftColor: CustomStringConvertible {
  /// Converts the border-left-color to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-left-color: red;
  /// border-left-color: #32a1ce;
  /// border-left-color: rgba(0, 0, 255, 0.5);
  /// border-left-color: currentcolor;
  /// ```
  public var description: String {
    switch self {
    case .color(let color):
      return color.description
    case .global(let global):
      return global.description
    }
  }
}
