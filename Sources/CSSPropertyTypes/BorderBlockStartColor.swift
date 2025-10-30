import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-start-color` property, which sets the color of the logical block-start border.
///
/// This logical property sets the color for the block-start border of an element. The actual physical
/// border it affects depends on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-start-color` sets the color
/// of the top border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐   ← border-block-start-color (top)
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │ ↑
/// │                           │ border-block-start-color (right)
/// └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the block-start border color to red
/// .borderBlockStartColor(.red)
///
/// // Set the block-start border color to a semi-transparent blue
/// .borderBlockStartColor(.rgba(0, 0, 255, 0.5))
///
/// // Set the block-start border color to a hex value
/// .borderBlockStartColor(.hex("#32a1ce"))
///
/// // Use the current text color
/// .borderBlockStartColor(.currentColor)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-start-color](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start-color)
public enum BorderBlockStartColor: Property, ColorConvertible {
  public static let property: String = "border-block-start-color"
  /// A specific color for the block-start border
  case color(CSSTypeTypes.Color)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-block-start-color with a specific color
  ///
  /// - Parameter color: The color for the block-start border
  public init(_ color: CSSTypeTypes.Color) {
    self = .color(color)
  }
}

/// Provides string conversion for CSS output
extension BorderBlockStartColor: CustomStringConvertible {
  /// Converts the border-block-start-color to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-block-start-color: red;
  /// border-block-start-color: #32a1ce;
  /// border-block-start-color: rgba(0, 0, 255, 0.5);
  /// border-block-start-color: currentcolor;
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
