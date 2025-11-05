import CSSTypeTypes
import Foundation

/// The CSS `grid-area` shorthand property specifies a grid item's size and location within a grid
/// by contributing a line, a span, or nothing (automatic) to its grid placement, thereby specifying
/// the edges of its grid area.
///
/// Example:
/// ```swift
/// .gridArea(.auto)                                   // grid-area: auto
/// .gridArea(.name("header"))                         // grid-area: header
/// .gridArea(.area(.init(1, 2, 3, 4)))                // grid-area: 1 / 2 / 3 / 4
/// .gridArea(.area(.init(1, 2)))                      // grid-area: 1 / 2
/// .gridArea(.span(2))                                // grid-area: span 2
/// .gridArea(.span("header"))                         // grid-area: span header
/// .gridArea(.global(.inherit))                       // grid-area: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-area](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-area)
public enum GridArea: Property {

    public static let property: String = "grid-area"

    /// Auto placement
    case auto

    /// Named grid area
    case name(String)

    /// Grid area with explicit coordinates
    case area(GridAreaCoordinates)

    /// A span to a named grid line
    case span(String)

    public static func span(_ value: Int) -> Self {
        .span("\(value)")
    }

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .name(let name):
            return name
        case .area(let area):
            return area.description
        case .span(let name):
            return "span \(name)"
        case .global(let value):
            return value.description
        }
    }
}

/// Represents coordinates defining a grid area
public struct GridAreaCoordinates: Sendable, Hashable, CustomStringConvertible {
    /// The row start position
    public let rowStart: GridLine

    /// The column start position
    public let columnStart: GridLine

    /// The row end position (optional)
    public let rowEnd: GridLine?

    /// The column end position (optional)
    public let columnEnd: GridLine?

    /// Creates a grid area with 2 values (rowStart and columnStart)
    ///
    /// - Parameters:
    ///   - rowStart: The row start position
    ///   - columnStart: The column start position
    public init(_ rowStart: Int, _ columnStart: Int) {
        self.rowStart = GridLine(rowStart)
        self.columnStart = GridLine(columnStart)
        self.rowEnd = nil
        self.columnEnd = nil
    }

    /// Creates a grid area with 4 values (rowStart, columnStart, rowEnd, columnEnd)
    ///
    /// - Parameters:
    ///   - rowStart: The row start position
    ///   - columnStart: The column start position
    ///   - rowEnd: The row end position
    ///   - columnEnd: The column end position
    public init(_ rowStart: Int, _ columnStart: Int, _ rowEnd: Int, _ columnEnd: Int) {
        self.rowStart = GridLine(rowStart)
        self.columnStart = GridLine(columnStart)
        self.rowEnd = GridLine(rowEnd)
        self.columnEnd = GridLine(columnEnd)
    }

    /// Creates a grid area with custom GridLine values
    ///
    /// - Parameters:
    ///   - rowStart: The row start position
    ///   - columnStart: The column start position
    ///   - rowEnd: The row end position (optional)
    ///   - columnEnd: The column end position (optional)
    public init(
        rowStart: GridLine,
        columnStart: GridLine,
        rowEnd: GridLine? = nil,
        columnEnd: GridLine? = nil
    ) {
        self.rowStart = rowStart
        self.columnStart = columnStart
        self.rowEnd = rowEnd
        self.columnEnd = columnEnd
    }

    public var description: String {
        if let rowEnd = rowEnd, let columnEnd = columnEnd {
            return "\(rowStart) / \(columnStart) / \(rowEnd) / \(columnEnd)"
        } else {
            return "\(rowStart) / \(columnStart)"
        }
    }
}

/// Represents a grid line position or span
public struct GridLine: Sendable, Hashable, CustomStringConvertible {
    /// The type of grid line specification
    private enum LineType: Sendable, Hashable {
        case number(Int)  // A numbered grid line
        case name(String)  // A named grid line
        case span(Int)  // A span of grid lines
        case spanName(String)  // A span to a named grid line
        case auto  // Automatic placement
    }

    private let type: LineType

    /// Creates a grid line by number
    public init(_ number: Int) {
        self.type = .number(number)
    }

    /// Creates a named grid line
    public init(_ name: String) {
        self.type = .name(name)
    }

    /// Creates a span of grid lines
    public init(span: Int) {
        self.type = .span(span)
    }

    /// Creates a span to a named grid line
    public init(span name: String) {
        self.type = .spanName(name)
    }

    /// Creates a line from the end (negative index)
    public static func end(_ number: Int) -> GridLine {
        // Ensure the number is negative
        let value = number > 0 ? -number : number
        return GridLine(value)
    }

    /// The auto keyword for grid line placement
    public static let auto = GridLine()

    /// Private initializer for auto value
    private init() {
        self.type = .auto
    }

    public var description: String {
        switch type {
        case .number(let number):
            return number.description
        case .name(let name):
            return name
        case .span(let span):
            return "span \(span)"
        case .spanName(let name):
            return "span \(name)"
        case .auto:
            return "auto"
        }
    }
}
