import CSSTypeTypes
import Foundation

/// The CSS `font-style` property sets whether a font should be styled with a normal, italic, 
/// or oblique face from its font family.
///
/// This property is used to select between normal, italic, or oblique faces within a font family.
///
/// Example:
/// ```swift
/// .fontStyle(.normal)              // font-style: normal
/// .fontStyle(.italic)              // font-style: italic
/// .fontStyle(.oblique)             // font-style: oblique
/// .fontStyle(.obliqueAngle(20))    // font-style: oblique 20deg
/// .fontStyle(.global(.inherit))    // font-style: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-style](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style)
public enum FontStyle: Property {
    public static let property: String = "font-style"
    /// Selects a font that is classified as normal within a font family
    case normal

    /// Selects a font that is classified as italic
    case italic

    /// Selects a font that is classified as oblique
    case oblique

    /// Selects an oblique font with a specific angle of slant
    /// - Parameter degrees: The angle of slant in degrees, between -90 and 90
    case obliqueAngle(Double)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .italic:
            return "italic"
        case .oblique:
            return "oblique"
        case .obliqueAngle(let degrees):
            // Clamp the angle to valid range
            let clampedDegrees = max(-90, min(90, degrees))
            return "oblique \(clampedDegrees)deg"
        case .global(let value):
            return value.description
        }
    }
}
