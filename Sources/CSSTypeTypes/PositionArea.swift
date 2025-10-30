import Foundation

/// Represents CSS position area values for anchor positioning.
///
/// The `PositionArea` type defines the cell or spanned cells of a position-area grid,
/// a 3x3 grid whose center cell is an anchor element. This type is used in the
/// experimental CSS anchor positioning module for the `position-area` property.
///
/// Example:
/// ```swift
/// .positionArea(.topRight)               // position-area: top right
/// .positionArea(.bottomLeft)             // position-area: bottom left
/// .positionArea(.center)                 // position-area: center
/// .positionArea(.top, .spanAll)          // position-area: top span-all
/// ```
///
/// - Note: CSS anchor positioning is an experimental feature with limited browser support.
///
/// - SeeAlso: [MDN Web Docs on position-area](https://developer.mozilla.org/en-US/docs/Web/CSS/position-area)
public enum PositionArea: Sendable, Hashable {
  /// A single physical value
  case physical(PhysicalValue)

  /// Two physical values (row and column)
  case physicalPair(PhysicalValue, PhysicalValue)

  /// A single logical value
  case logical(LogicalValue)

  /// Two logical values
  case logicalPair(LogicalValue, LogicalValue)

  /// A single coordinate value
  case coordinate(CoordinateValue)

  /// Two coordinate values (x and y axes)
  case coordinatePair(CoordinateValue, CoordinateValue)

  /// Physical value keywords
  public enum PhysicalValue: String, Sendable, Hashable {
    // Basic positions
    /// Top edge of the grid
    case top

    /// Center of the grid
    case center

    /// Bottom edge of the grid
    case bottom

    /// Left edge of the grid
    case left

    /// Right edge of the grid
    case right

    // Spanning keywords
    /// Span to include the center and left columns
    case spanLeft = "span-left"

    /// Span to include the center and right columns
    case spanRight = "span-right"

    /// Span to include the center and top rows
    case spanTop = "span-top"

    /// Span to include the center and bottom rows
    case spanBottom = "span-bottom"

    /// Span all cells in the row or column
    case spanAll = "span-all"
  }

  /// Logical value keywords
  public enum LogicalValue: String, Sendable, Hashable {
    // Generic logical positions
    /// Start position based on the containing block's writing mode
    case start

    /// End position based on the containing block's writing mode
    case end

    /// Center position
    case center

    /// Start position based on the element's own writing mode
    case selfStart = "self-start"

    /// End position based on the element's own writing mode
    case selfEnd = "self-end"

    // Explicit logical positions
    /// Start of the block axis
    case blockStart = "block-start"

    /// End of the block axis
    case blockEnd = "block-end"

    /// Start of the inline axis
    case inlineStart = "inline-start"

    /// End of the inline axis
    case inlineEnd = "inline-end"

    // Spanning keywords
    /// Span to include the center and start positions
    case spanStart = "span-start"

    /// Span to include the center and end positions
    case spanEnd = "span-end"

    /// Span to include the center and block-start positions
    case spanBlockStart = "span-block-start"

    /// Span to include the center and block-end positions
    case spanBlockEnd = "span-block-end"

    /// Span to include the center and inline-start positions
    case spanInlineStart = "span-inline-start"

    /// Span to include the center and inline-end positions
    case spanInlineEnd = "span-inline-end"

    /// Span to include the center and self-start positions
    case spanSelfStart = "span-self-start"

    /// Span to include the center and self-end positions
    case spanSelfEnd = "span-self-end"

    /// Span all cells in the row or column
    case spanAll = "span-all"
  }

  /// Coordinate value keywords
  public enum CoordinateValue: String, Sendable, Hashable {
    // X-axis keywords
    /// Start of the x-axis based on the containing block's writing mode
    case xStart = "x-start"

    /// End of the x-axis based on the containing block's writing mode
    case xEnd = "x-end"

    /// Start of the x-axis based on the element's own writing mode
    case xSelfStart = "x-self-start"

    /// End of the x-axis based on the element's own writing mode
    case xSelfEnd = "x-self-end"

    // Y-axis keywords
    /// Start of the y-axis based on the containing block's writing mode
    case yStart = "y-start"

    /// End of the y-axis based on the containing block's writing mode
    case yEnd = "y-end"

    /// Start of the y-axis based on the element's own writing mode
    case ySelfStart = "y-self-start"

    /// End of the y-axis based on the element's own writing mode
    case ySelfEnd = "y-self-end"

    /// Center position
    case center

    // Spanning keywords
    /// Span to include the center and x-start positions
    case spanXStart = "span-x-start"

    /// Span to include the center and x-end positions
    case spanXEnd = "span-x-end"

    /// Span to include the center and y-start positions
    case spanYStart = "span-y-start"

    /// Span to include the center and y-end positions
    case spanYEnd = "span-y-end"

    /// Span all cells in the row or column
    case spanAll = "span-all"
  }

  /// Convenient preset position areas

  /// Top-left corner of the grid
  public static let topLeft: PositionArea = .physicalPair(.top, .left)

  /// Top-right corner of the grid
  public static let topRight: PositionArea = .physicalPair(.top, .right)

  /// Bottom-left corner of the grid
  public static let bottomLeft: PositionArea = .physicalPair(.bottom, .left)

  /// Bottom-right corner of the grid
  public static let bottomRight: PositionArea = .physicalPair(.bottom, .right)

  /// Center of the grid
  public static let center: PositionArea = .physical(.center)

  /// Top edge of the grid, spanning all columns
  public static let top: PositionArea = .physicalPair(.top, .spanAll)

  /// Bottom edge of the grid, spanning all columns
  public static let bottom: PositionArea = .physicalPair(.bottom, .spanAll)

  /// Left edge of the grid, spanning all rows
  public static let left: PositionArea = .physicalPair(.left, .spanAll)

  /// Right edge of the grid, spanning all rows
  public static let right: PositionArea = .physicalPair(.right, .spanAll)

  /// Start of the grid in both directions
  public static let start: PositionArea = .logical(.start)

  /// End of the grid in both directions
  public static let end: PositionArea = .logical(.end)
}

/// Provides string conversion for CSS output
extension PositionArea: CustomStringConvertible {
  /// Converts the position area to its CSS string representation
  public var description: String {
    switch self {
    case .physical(let value):
      return value.rawValue

    case .physicalPair(let value1, let value2):
      return "\(value1.rawValue) \(value2.rawValue)"

    case .logical(let value):
      return value.rawValue

    case .logicalPair(let value1, let value2):
      return "\(value1.rawValue) \(value2.rawValue)"

    case .coordinate(let value):
      return value.rawValue

    case .coordinatePair(let value1, let value2):
      return "\(value1.rawValue) \(value2.rawValue)"
    }
  }
}
