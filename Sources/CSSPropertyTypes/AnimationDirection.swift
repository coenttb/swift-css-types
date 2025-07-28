import CSSTypeTypes
import Foundation

/// The CSS animation-direction property sets whether an animation should play
/// forward, backward, or alternate back and forth between playing the sequence forward and backward.
///
/// Example:
/// ```swift
/// .animationDirection(.normal)            // animation-direction: normal
/// .animationDirection(.reverse)           // animation-direction: reverse
/// .animationDirection(.alternate)         // animation-direction: alternate
/// .animationDirection(.alternateReverse)  // animation-direction: alternate-reverse
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-direction](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-direction)
public enum AnimationDirection: Property {

    public static let property: String = "animation-direction"

    /// The animation plays forwards each cycle (default)
    case normal

    /// The animation plays backwards each cycle
    case reverse

    /// The animation reverses direction each cycle, with the first iteration being played forwards
    case alternate

    /// The animation reverses direction each cycle, with the first iteration being played backwards
    case alternateReverse

    /// Global value
    case global(CSSTypeTypes.Global)
}

extension AnimationDirection {
    public static let allCases: [AnimationDirection] = [
        .normal,
        .reverse,
        .alternate,
        .alternateReverse
    ] + Global.allCases.map(AnimationDirection.global)
}

/// CSS Output conversion
extension AnimationDirection: CustomStringConvertible {
    /// Converts the animation direction to its CSS string representation
    public var description: String {
        switch self {
        case .normal: return "normal"
        case .reverse: return "reverse"
        case .alternate: return "alternate"
        case .alternateReverse: return "alternate-reverse"
        case .global(let global): return global.description
        }
    }
}
