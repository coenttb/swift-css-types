import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-end-style` property, which sets the style of the logical block-end border.
///
/// This logical property sets the style for the block-end border of an element. The actual physical
/// border it affects depends on the element's writing mode, directionality, and text orientation.
/// For example, in horizontal top-to-bottom writing mode, `border-block-end-style` sets the style
/// of the bottom border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └- - - - - - - - - - - - - -┘   ← border-block-end-style: dashed (bottom)
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///   ↑
///   border-block-end-style: dashed (left)
/// ```
///
/// Example:
/// ```swift
/// // Set the block-end border style to solid
/// .borderBlockEndStyle(.solid)
///
/// // Set the block-end border style to dotted
/// .borderBlockEndStyle(.dotted)
///
/// // Set the block-end border style to double
/// .borderBlockEndStyle(.double)
///
/// // Set the block-end border style to groove
/// .borderBlockEndStyle(.groove)
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-end-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end-style)
public enum BorderBlockEndStyle: Property {

  public static let property: String = "border-block-end-style"

  /// A specific line style for the block-end border
  case lineStyle(LineStyle)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-block-end-style with a specific line style
  ///
  /// - Parameter style: The line style for the block-end border
  public init(_ style: LineStyle) {
    self = .lineStyle(style)
  }
}

/// Provides string conversion for CSS output
extension BorderBlockEndStyle: CustomStringConvertible {
  /// Converts the border-block-end-style to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-block-end-style: solid;
  /// border-block-end-style: dotted;
  /// border-block-end-style: dashed;
  /// border-block-end-style: double;
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

/// Convenience methods for creating BorderBlockEndStyle values
extension BorderBlockEndStyle {
  /// The default border-block-end-style value (none)
  public static let `default` = BorderBlockEndStyle(.none)

  /// Creates a none border-block-end-style (invisible)
  public static let none = BorderBlockEndStyle(.none)

  /// Creates a hidden border-block-end-style (invisible, high priority in border collapsing)
  public static let hidden = BorderBlockEndStyle(.hidden)

  /// Creates a solid border-block-end-style
  public static let solid = BorderBlockEndStyle(.solid)

  /// Creates a dotted border-block-end-style
  public static let dotted = BorderBlockEndStyle(.dotted)

  /// Creates a dashed border-block-end-style
  public static let dashed = BorderBlockEndStyle(.dashed)

  /// Creates a double border-block-end-style
  public static let double = BorderBlockEndStyle(.double)

  /// Creates a groove border-block-end-style
  public static let groove = BorderBlockEndStyle(.groove)

  /// Creates a ridge border-block-end-style
  public static let ridge = BorderBlockEndStyle(.ridge)

  /// Creates a inset border-block-end-style
  public static let inset = BorderBlockEndStyle(.inset)

  /// Creates a outset border-block-end-style
  public static let outset = BorderBlockEndStyle(.outset)
}
