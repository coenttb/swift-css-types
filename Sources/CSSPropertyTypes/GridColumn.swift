import Foundation
import CSSTypeTypes

/// The CSS `grid-column` shorthand property specifies a grid item's size and location within 
/// a grid by contributing a line, a span, or nothing (automatic) to its grid placement, 
/// thereby specifying the start and end edge of its grid column area.
///
/// This property is a shorthand for `grid-column-start` and `grid-column-end`.
///
/// Example:
/// ```swift
/// .gridColumn(.auto)                      // grid-column: auto
/// .gridColumn(.line(1))                   // grid-column: 1
/// .gridColumn(.line(1), .line(3))         // grid-column: 1 / 3
/// .gridColumn(.line(2), .lineEnd(-1))     // grid-column: 2 / -1
/// .gridColumn(.line(1), .span(2))         // grid-column: 1 / span 2
/// .gridColumn(.span(2), .line(7))         // grid-column: span 2 / 7
/// .gridColumn(.name("header"))            // grid-column: header
/// .gridColumn(.name("start"), .name("end")) // grid-column: start / end
/// .gridColumn(.global(.inherit))          // grid-column: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-column](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column)
public enum GridColumn: Property {
    
    public static let property: String = "grid-column"
    
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
    case placement(GridColumnValue, GridColumnValue)
    
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

/// Represents a value that can be used for grid column placement
public enum GridColumnValue: Sendable, Equatable, CustomStringConvertible {
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
