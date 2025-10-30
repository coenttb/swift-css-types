import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-style` property, which sets the style of the logical inline borders.
///
/// This logical property sets the style for the inline borders of an element. The actual physical
/// borders it affects depend on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-inline-style` sets the style
/// of the left and right borders.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌─────┬─────────────────┬─────┐
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// │     │                 │     │
/// └─────┴─────────────────┴─────┘
///   ↑                       ↑
///   border-inline-start-    border-inline-end-
///   style (left)            style (right)
///
/// vertical-rl writing mode:
/// ┌─────────────────────────────┐
/// │                             │   ← border-inline-start-style (top)
/// ├─────────────────────────────┤
/// │                             │
/// │                             │
/// │                             │
/// ├─────────────────────────────┤
/// │                             │   ← border-inline-end-style (bottom)
/// └─────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set the inline border style to solid
/// .borderInlineStyle(.solid)
///
/// // Set the inline border style to dashed
/// .borderInlineStyle(.dashed)
///
/// // Set the inline border style to dotted
/// .borderInlineStyle(.dotted)
///
/// // Set the inline border style to double
/// .borderInlineStyle(.double)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-inline-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-style)
public enum BorderInlineStyle: Property {

  public static let property: String = "border-inline-style"

  /// A specific style for both inline borders
  case lineStyle(LineStyle)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-inline-style with a specific style
  ///
  /// - Parameter style: The style for both inline borders
  public init(_ style: LineStyle) {
    self = .lineStyle(style)
  }
}

/// Provides string conversion for CSS output
extension BorderInlineStyle: CustomStringConvertible {
  /// Converts the border-inline-style to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-inline-style: solid;
  /// border-inline-style: dashed;
  /// border-inline-style: dotted;
  /// border-inline-style: double;
  /// ```
  public var description: String {
    switch self {
    case .lineStyle(let lineStyle):
      return lineStyle.description
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for creating BorderInlineStyle values
extension BorderInlineStyle {
  /// The default border-inline-style value (none)
  public static let `default` = BorderInlineStyle(.none)

  /// Creates a none border-inline-style
  public static let none = BorderInlineStyle(.none)

  /// Creates a hidden border-inline-style
  public static let hidden = BorderInlineStyle(.hidden)

  /// Creates a solid border-inline-style
  public static let solid = BorderInlineStyle(.solid)

  /// Creates a dashed border-inline-style
  public static let dashed = BorderInlineStyle(.dashed)

  /// Creates a dotted border-inline-style
  public static let dotted = BorderInlineStyle(.dotted)

  /// Creates a double border-inline-style
  public static let double = BorderInlineStyle(.double)

  /// Creates a groove border-inline-style
  public static let groove = BorderInlineStyle(.groove)

  /// Creates a ridge border-inline-style
  public static let ridge = BorderInlineStyle(.ridge)

  /// Creates an inset border-inline-style
  public static let inset = BorderInlineStyle(.inset)

  /// Creates an outset border-inline-style
  public static let outset = BorderInlineStyle(.outset)
}
