import CSSTypeTypes
import Foundation

/// The CSS `grid-row` shorthand property specifies a grid item's size and location within
/// a grid by contributing a line, a span, or nothing (automatic) to its grid placement,
/// thereby specifying the start and end edge of its grid row area.
///
/// This property is a shorthand for `grid-row-start` and `grid-row-end`.
///
/// Example:
/// ```swift
/// .gridRow(.auto)                        // grid-row: auto
/// .gridRow(.line(1))                     // grid-row: 1
/// .gridRow(.line(1), .line(3))           // grid-row: 1 / 3
/// .gridRow(.line(2), .lineEnd(-1))       // grid-row: 2 / -1
/// .gridRow(.line(1), .span(2))           // grid-row: 1 / span 2
/// .gridRow(.span(2), .line(7))           // grid-row: span 2 / 7
/// .gridRow(.name("header"))              // grid-row: header
/// .gridRow(.name("start"), .name("end")) // grid-row: start / end
/// .gridRow(.global(.inherit))            // grid-row: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-row](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row)
public enum GridRow: Property {
  public static let property: String = "grid-row"
  /// Auto placement
  case auto

  /// Placement using a single grid line
  case line(Int)

  /// Placement using a named grid line or area
  case name(String)

  /// Placement spanning a specific number of tracks
  case span(Int)

  /// Placement spanning to a named grid line
  case spanTo(String)

  /// Placement with explicit start and end
  case placement(GridRowValue, GridRowValue)

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .line(let lineNum):
      return "\(lineNum)"
    case .name(let name):
      return name
    case .span(let tracks):
      return "span \(tracks)"
    case .spanTo(let name):
      return "span \(name)"
    case .placement(let start, let end):
      return "\(start) / \(end)"
    case .global(let value):
      return value.description
    }
  }
}

/// Represents a value that can be used for grid row placement
public enum GridRowValue: Sendable, Hashable, CustomStringConvertible {
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
    }
  }
}
