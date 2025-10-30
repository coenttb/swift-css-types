import CSSTypeTypes
import Foundation

/// The CSS `columns` shorthand property sets the number of columns to use when drawing an element's contents,
/// as well as those columns' widths.
///
/// Example:
/// ```swift
/// .columns(.count(2))                    // columns: 2
/// .columns(.width(.em(12)))              // columns: 12em
/// .columns(.width(.em(6)), .auto)        // columns: 6rem auto
/// .columns(.auto, .count(3))             // columns: auto 3
/// ```
///
/// This is a shorthand for setting `column-width` and `column-count` in a single declaration.
///
/// - SeeAlso: [MDN Web Docs on columns](https://developer.mozilla.org/en-US/docs/Web/CSS/columns)
public enum Columns: Property {
  public static let property: String = "columns"

  /// Set both column width and column count
  case both(ColumnWidth, ColumnCount)

  /// Set only column width
  case width(ColumnWidth)

  /// Set only column count
  case count(ColumnCount)

  /// Global values
  case global(CSSTypeTypes.Global)
}

extension Columns: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> Columns {
    .width(.init(length))
  }
}

/// CSS Output conversion for Columns
extension Columns: CustomStringConvertible {
  public var description: String {
    switch self {
    case .both(let width, let count):
      return "\(width) \(count)"

    case .width(let width):
      return width.description

    case .count(let count):
      return count.description

    case .global(let global):
      return global.description
    }
  }
}

/// Factory methods for creating columns values
extension Columns {
  /// Auto-sized columns
  public static let auto: Columns = .count(.auto)

}
