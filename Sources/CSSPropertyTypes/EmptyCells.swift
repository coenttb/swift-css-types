import CSSTypeTypes
import Foundation

/// The `empty-cells` CSS property controls whether borders and backgrounds are displayed 
/// around table cells that have no visible content.
///
/// This property only has an effect when the `border-collapse` property is set to `separate`.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/empty-cells)
public enum EmptyCells: Property {
    public static let property: String = "empty-cells"

    /// Borders and backgrounds are drawn around empty cells, just like normal cells
    case show

    /// No borders or backgrounds are drawn around empty cells
    case hide

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .show:
            return "show"
        case .hide:
            return "hide"
        case .global(let value):
            return value.description
        }
    }
}
