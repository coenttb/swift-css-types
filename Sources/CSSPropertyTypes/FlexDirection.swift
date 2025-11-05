import CSSTypeTypes
import Foundation

/// The CSS `flex-direction` property sets how flex items are placed in the flex container by defining the main axis and direction.
///
/// It determines the direction in which flex items are laid out in the flex container.
///
/// Example:
/// ```swift
/// .flexDirection(.row)                // flex-direction: row
/// .flexDirection(.rowReverse)         // flex-direction: row-reverse
/// .flexDirection(.column)             // flex-direction: column
/// .flexDirection(.global(.inherit))   // flex-direction: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex-direction](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction)
public enum FlexDirection: Property {
    public static let property: String = "flex-direction"

    /// Default value. The flex container's main axis has the same orientation as the text direction.
    case row

    /// Same as `row` but in the opposite direction
    case rowReverse

    /// The flex container's main axis is vertical, items are placed from top to bottom
    case column

    /// Same as `column` but in the opposite direction
    case columnReverse

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .row:
            return "row"
        case .rowReverse:
            return "row-reverse"
        case .column:
            return "column"
        case .columnReverse:
            return "column-reverse"
        case .global(let value):
            return value.description
        }
    }
}
