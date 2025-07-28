import CSSTypeTypes
import Foundation

/// The CSS `grid-auto-flow` property controls how the auto-placement algorithm works,
/// specifying exactly how auto-placed items get flowed into the grid.
///
/// Example:
/// ```swift
/// .gridAutoFlow(.row)         // grid-auto-flow: row
/// .gridAutoFlow(.column)      // grid-auto-flow: column
/// .gridAutoFlow(.rowDense)    // grid-auto-flow: row dense
/// .gridAutoFlow(.columnDense) // grid-auto-flow: column dense
/// .gridAutoFlow(.global(.inherit)) // grid-auto-flow: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on grid-auto-flow](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-auto-flow)
public enum GridAutoFlow: Property {

    public static let property: String = "grid-auto-flow"

    /// Items are placed by filling each row in turn, adding new rows as necessary.
    /// This is the default behavior.
    case row

    /// Items are placed by filling each column in turn, adding new columns as necessary.
    case column

    /// Items are placed by filling each row in turn, but the algorithm attempts to fill in holes 
    /// earlier in the grid if smaller items come up later (dense packing)
    case rowDense

    /// Items are placed by filling each column in turn, but the algorithm attempts to fill in holes 
    /// earlier in the grid if smaller items come up later (dense packing)
    case columnDense

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .row:
            return "row"
        case .column:
            return "column"
        case .rowDense:
            return "row dense"
        case .columnDense:
            return "column dense"
        case .global(let value):
            return value.description
        }
    }
}
