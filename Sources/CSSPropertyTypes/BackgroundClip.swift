import CSSTypeTypes
import Foundation

/// Represents the CSS `background-clip` property, which determines the area within which the background is painted.
///
/// The background-clip property sets whether an element's background extends underneath its border box,
/// padding box, content box, or even just the foreground text.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │     ┌─────────────┐       │  │     ┌─────────────┐       │
/// │     │             │       │  │     │             │       │
/// │     │  content    │       │  │     │  padding    │       │
/// │     │             │       │  │     │             │       │
/// │     └─────────────┘       │  │     └─────────────┘       │
/// │          border           │  │          border           │
/// └───────────────────────────┘  └───────────────────────────┘
///     background-clip:              background-clip:
///     border-box                    padding-box
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │     ┌─────────────┐       │  │     ┌─────────────┐       │
/// │     │ ▓▓▓▓▓▓▓▓▓▓▓ │       │  │     │             │       │
/// │     │ ▓content▓▓▓ │       │  │     │   TEXTEXT   │       │
/// │     │ ▓▓▓▓▓▓▓▓▓▓▓ │       │  │     │             │       │
/// │     └─────────────┘       │  │     └─────────────┘       │
/// │          border           │  │          border           │
/// └───────────────────────────┘  └───────────────────────────┘
///     background-clip:              background-clip:
///     content-box                   text
/// ```
///
/// Example:
/// ```swift
/// // Clip background to the padding box (default)
/// .backgroundClip(.paddingBox)
///
/// // Clip background to the border box
/// .backgroundClip(.borderBox)
///
/// // Clip background to the content box
/// .backgroundClip(.contentBox)
///
/// // Clip background to text (for text effect)
/// .backgroundClip(.text)
/// .color(.transparent) // Make text transparent
/// ```
///
/// - Note: When using `background-clip: text`, make sure to set a text color with some transparency
///         to see the effect, and provide a fallback for browsers that don't support it.
///
/// - SeeAlso: [MDN Web Docs on background-clip](https://developer.mozilla.org/en-US/docs/Web/CSS/background-clip)
public enum BackgroundClip: Property {

    public static let property: String = "background-clip"

    /// The background extends to the outside edge of the border
    case borderBox

    /// The background extends to the outside edge of the padding (default)
    case paddingBox

    /// The background is painted within the content box
    case contentBox

    /// The background is painted within the foreground text
    case text

    /// The background is painted within the area painted by the border
    ///
    /// Takes border-width and border-style into account but ignores any
    /// transparency introduced by border-color.
    case borderArea

    /// Multiple clip values for multiple backgrounds
    case multiple([BackgroundClip])

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BackgroundClip: CustomStringConvertible {
    /// Converts the background-clip value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-clip: border-box;
    /// background-clip: content-box;
    /// background-clip: text;
    /// ```
    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"
        case .paddingBox:
            return "padding-box"
        case .contentBox:
            return "content-box"
        case .text:
            return "text"
        case .borderArea:
            return "border-area"
        case .multiple(let clips):
            return clips.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundClip {
    /// The default value for background-clip (`border-box`)
    public static let `default` = BackgroundClip.borderBox

    /// Creates a background-clip with multiple values
    ///
    /// - Parameter clips: The background clip values
    /// - Returns: A background-clip with multiple values
    public static func values(_ clips: [BackgroundClip]) -> BackgroundClip {
        if clips.count == 1, case let clip = clips[0] {
            return clip
        }
        return .multiple(clips)
    }

    /// Creates a background-clip with multiple values
    ///
    /// - Parameter clips: The background clip values
    /// - Returns: A background-clip with multiple values
    public static func values(_ clips: BackgroundClip...) -> BackgroundClip {
        values(clips)
    }
}
