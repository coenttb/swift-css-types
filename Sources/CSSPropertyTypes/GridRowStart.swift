import CSSTypeTypes
import Foundation

/// The CSS `grid-row-start` property specifies a grid item's start position within the
/// grid row by contributing a line, a span, or nothing (automatic) to its grid placement.
///
/// Example:
/// ```swift
/// .gridRowStart(.auto)          // grid-row-start: auto
/// .gridRowStart(.line(1))       // grid-row-start: 1
/// .gridRowStart(.name("header")) // grid-row-start: header
/// .gridRowStart(.span(2))       // grid-row-start: span 2
/// .gridRowStart(.lineEnd(-1))   // grid-row-start: -1
/// .gridRowStart(.global(.inherit)) // grid-row-start: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-row-start](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-start)
public enum GridRowStart: Property {

  public static let property: String = "grid-row-start"

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
