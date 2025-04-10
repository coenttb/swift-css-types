import Foundation
import CSSTypeTypes

/// The CSS `grid-column-start` property specifies a grid item's start position within the 
/// grid column by contributing a line, a span, or nothing (automatic) to its grid placement.
///
/// Example:
/// ```swift
/// .gridColumnStart(.auto)          // grid-column-start: auto
/// .gridColumnStart(.line(1))       // grid-column-start: 1
/// .gridColumnStart(.name("header")) // grid-column-start: header
/// .gridColumnStart(.span(2))       // grid-column-start: span 2
/// .gridColumnStart(.lineEnd(-1))   // grid-column-start: -1
/// .gridColumnStart(.global(.inherit)) // grid-column-start: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-column-start](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-start)
public enum GridColumnStart: Property {
    
    public static let property: String = "grid-column-start"
    
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
