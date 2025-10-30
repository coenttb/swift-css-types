import CSSTypeTypes
import Foundation

/// The CSS `outline-style` property sets the style of an element's outline.
///
/// An outline is a line that is drawn around an element, outside the border.
/// Unlike borders, outlines don't affect layout and can be non-rectangular.
///
/// Example:
/// ```swift
/// .outlineStyle(.none)     // outline-style: none
/// .outlineStyle(.dotted)   // outline-style: dotted
/// .outlineStyle(.solid)    // outline-style: solid
/// .outlineStyle(.groove)   // outline-style: groove
/// ```
///
/// - SeeAlso: [MDN Web Docs on outline-style](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-style)
public enum OutlineStyle: Property {
  public static let property: String = "outline-style"

  /// Browser's default style for outlines
  case auto

  /// No outline is displayed
  case none

  /// The outline is a series of dots
  case dotted

  /// The outline is a series of short line segments
  case dashed

  /// The outline is a single line
  case solid

  /// The outline is two single lines
  case double

  /// The outline looks as though it were carved into the page
  case groove

  /// The outline looks as though it were extruded from the page
  case ridge

  /// The outline makes the box look as though it were embedded in the page
  case inset

  /// The outline makes the box look as though it were coming out of the page
  case outset

  /// Global value
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OutlineStyle: CustomStringConvertible {
  /// Converts the outline-style value to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .none:
      return "none"
    case .dotted:
      return "dotted"
    case .dashed:
      return "dashed"
    case .solid:
      return "solid"
    case .double:
      return "double"
    case .groove:
      return "groove"
    case .ridge:
      return "ridge"
    case .inset:
      return "inset"
    case .outset:
      return "outset"
    case .global(let global):
      return global.description
    }
  }
}
