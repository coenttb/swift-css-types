import CSSTypeTypes
import Foundation

/// The CSS `caption-side` property puts the content of a table's `<caption>` on the specified side.
/// The values are relative to the writing-mode of the table.
///
/// Example:
/// ```swift
/// .captionSide(.top)     // caption-side: top
/// .captionSide(.bottom)  // caption-side: bottom
/// ```
///
/// - Note: This property only applies to table caption elements.
///
/// - SeeAlso: [MDN Web Docs on caption-side](https://developer.mozilla.org/en-US/docs/Web/CSS/caption-side)
public enum CaptionSide: Property {
    public static let property: String = "caption-side"

    /// The caption box should be positioned at the block start side of the table (typically the top).
    case top

    /// The caption box should be positioned at the block end side of the table (typically the bottom).
    case bottom

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .top: return "top"
        case .bottom: return "bottom"
        case .global(let global): return global.description
        }
    }
}
