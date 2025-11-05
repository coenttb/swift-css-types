import CSSTypeTypes
import Foundation

/// The CSS `caret-color` property sets the color of the insertion caret, the visible marker where the next
/// character typed will be inserted. This is sometimes referred to as the text input cursor.
///
/// The caret appears in elements such as `<input>` or those with the `contenteditable` attribute.
/// It's typically a thin vertical line that flashes to help make it more noticeable.
///
/// Example:
/// ```swift
/// .caretColor(.auto)                // caret-color: auto
/// .caretColor(.transparent)         // caret-color: transparent
/// .caretColor(.currentColor)        // caret-color: currentcolor
/// .caretColor(.named(.red))         // caret-color: red
/// .caretColor(.hex("#5729e9"))      // caret-color: #5729e9
/// .caretColor(.rgb(0, 200, 0))      // caret-color: rgb(0, 200, 0)
/// ```
///
/// - Note: The insertion caret is different from the mouse cursor. When hovering over text,
///         the mouse cursor's appearance is controlled by the `cursor` property, not `caret-color`.
///
/// - SeeAlso: [MDN Web Docs on caret-color](https://developer.mozilla.org/en-US/docs/Web/CSS/caret-color)
public enum CaretColor: Property, ColorConvertible {
    public static let property: String = "caret-color"
    /// The user agent selects an appropriate color for the caret. This is generally `currentcolor`, but the
    /// user agent may choose a different color to ensure good visibility and contrast with the surrounding content.
    case auto

    /// A specific color for the caret.
    case color(CSSTypeTypes.Color)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension CaretColor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .color(let color):
            return color.description

        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods for creating CaretColor values
extension CaretColor {

    /// Creates a transparent caret color
    public static let transparent: CaretColor = .color(.transparent)

    /// Creates a caret color that matches the current text color
    public static let currentColor: CaretColor = .color(.currentColor)
}
