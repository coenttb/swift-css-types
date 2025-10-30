import CSSTypeTypes
import Foundation

/// The CSS `grid-row-end` property specifies a grid item's end position within the
/// grid row by contributing a line, a span, or nothing (automatic) to its grid placement.
///
/// Example:
/// ```swift
/// .gridRowEnd(.auto)          // grid-row-end: auto
/// .gridRowEnd(.line(3))       // grid-row-end: 3
/// .gridRowEnd(.name("footer")) // grid-row-end: footer
/// .gridRowEnd(.span(2))       // grid-row-end: span 2
/// .gridRowEnd(.lineEnd(-1))   // grid-row-end: -1
/// .gridRowEnd(.global(.inherit)) // grid-row-end: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-row-end](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-end)
public enum GridRowEnd: Property {

  public static let property: String = "grid-row-end"

  /// Auto placement
  case auto

  /// A specific numbered grid line
  case line(Int)

  /// A specific line from the end (negative values)
  case lineEnd(Int)

  /// A named grid line
  case name(String)

  /// A span of tracks
  case span(Int)

  /// A span to a named line
  case spanTo(String)

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .line(let lineNum):
      return "\(lineNum)"
    case .lineEnd(let lineNum):
      // lineEnd values are expected to be negative, but we'll handle positive values too
      let value = lineNum > 0 ? -lineNum : lineNum
      return "\(value)"
    case .name(let name):
      return name
    case .span(let tracks):
      return "span \(tracks)"
    case .spanTo(let name):
      return "span \(name)"
    case .global(let value):
      return value.description
    }
  }
}
