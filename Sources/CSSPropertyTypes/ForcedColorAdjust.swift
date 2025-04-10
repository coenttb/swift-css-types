import Foundation
import CSSTypeTypes

/// The CSS `forced-color-adjust` property allows authors to opt certain elements out of
/// forced colors mode, which is an accessibility feature that limits the color palette.
///
/// This property is important for internationalization as it helps ensure that content
/// remains accessible to users with specific color perception needs, while still allowing
/// essential color information to be preserved when necessary.
///
/// Example:
/// ```swift
/// .forcedColorAdjust(.auto)                  // forced-color-adjust: auto
/// .forcedColorAdjust(.none)                  // forced-color-adjust: none
/// .forcedColorAdjust(.preserveParentColor)   // forced-color-adjust: preserve-parent-color
/// ```
///
/// - Note: This property should only be used to make changes that support a user's
///         color and contrast requirements. It should not be used to prevent user choices
///         from being respected.
///
/// - SeeAlso: [MDN Web Docs on forced-color-adjust](https://developer.mozilla.org/en-US/docs/Web/CSS/forced-color-adjust)
public enum ForcedColorAdjust: Property {
    
    public static let property: String = "forced-color-adjust"
    
    /// The element's colors are adjusted by the user agent in forced colors mode.
    /// This is the default.
    case auto
    
    /// The element's colors are not automatically adjusted by the user agent
    /// in forced colors mode.
    case none
    
    /// In forced colors mode, if the color property inherits from its parent,
    /// it computes to the used color of its parent's color property.
    /// In all other cases, it behaves the same as `none`.
    case preserveParentColor
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .preserveParentColor:
            return "preserve-parent-color"
        case .global(let global):
            return global.description
        }
    }
}


