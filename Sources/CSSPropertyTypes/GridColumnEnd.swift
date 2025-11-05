import CSSTypeTypes
import Foundation

/// The CSS `grid-column-end` property specifies a grid item's end position within the
/// grid column by contributing a line, a span, or nothing (automatic) to its grid placement.
///
/// Example:
/// ```swift
/// .gridColumnEnd(.auto)          // grid-column-end: auto
/// .gridColumnEnd(.line(3))       // grid-column-end: 3
/// .gridColumnEnd(.name("footer")) // grid-column-end: footer
/// .gridColumnEnd(.span(2))       // grid-column-end: span 2
/// .gridColumnEnd(.lineEnd(-1))   // grid-column-end: -1
/// .gridColumnEnd(.global(.inherit)) // grid-column-end: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-column-end](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-column-end)
public enum GridColumnEnd: Property {

    public static let property: String = "grid-column-end"

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
