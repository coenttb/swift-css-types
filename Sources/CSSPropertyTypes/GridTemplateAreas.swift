import CSSTypeTypes
import Foundation

/// The CSS `grid-template-areas` property specifies named grid areas, establishing the cells in the grid and assigning them names.
///
/// Named grid areas can be referenced from the grid-placement properties (`grid-row-start`, `grid-row-end`, 
/// `grid-column-start`, `grid-column-end`), and their shorthands (`grid-row`, `grid-column`, and `grid-area`).
///
/// Example:
/// ```swift
/// .gridTemplateAreas(.none)                                 // grid-template-areas: none
/// .gridTemplateAreas(.areas(["a b", "a c d"]))             // grid-template-areas: "a b" "a c d"
/// .gridTemplateAreas(.areas([
///     "a a a",
///     "b c c",
///     "b c c"
/// ]))                                                      // grid-template-areas: "a a a" "b c c" "b c c"
/// .gridTemplateAreas(.areas([
///     "a a .",
///     "a a .",
///     ". b c"
/// ]))                                                      // grid-template-areas: "a a ." "a a ." ". b c"
/// .gridTemplateAreas(.global(.inherit))                     // grid-template-areas: inherit
/// ```
///
/// - Note: A null cell token (`.` character) can be used to create empty spaces in the grid.
/// - Note: Multiple cell tokens with the same name create a single named grid area that spans the corresponding grid cells.
///         These cells must form a rectangle, otherwise the declaration is invalid.
///
/// - SeeAlso: [MDN Web Docs on grid-template-areas](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-template-areas)
public enum GridTemplateAreas: Property {

    public static let property: String = "grid-template-areas"

    /// The grid container doesn't define any named grid areas
    case none

    /// Defines named grid areas using strings
    /// Each string represents a row in the grid
    case areas([String])

    /// Global values (inherit, initial, etc.)
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .areas(let areas):
            return areas.map { "\"\($0)\"" }.joined(separator: " ")
        case .global(let value):
            return value.description
        }
    }
}
