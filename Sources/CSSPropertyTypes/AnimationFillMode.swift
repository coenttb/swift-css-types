import CSSTypeTypes
import Foundation

/// The CSS animation-fill-mode property sets how a CSS animation applies styles
/// to its target before and after its execution.
///
/// Example:
/// ```swift
/// .animationFillMode(.none)        // animation-fill-mode: none
/// .animationFillMode(.forwards)    // animation-fill-mode: forwards
/// .animationFillMode(.backwards)   // animation-fill-mode: backwards
/// .animationFillMode(.both)        // animation-fill-mode: both
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-fill-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode)
public enum AnimationFillMode: Property {

    public static let property: String = "animation-fill-mode"

    /// The animation will not apply any styles to the target when it's not executing (default)
    case none

    /// The target will retain the computed values set by the last keyframe encountered during execution
    case forwards

    /// The animation will apply the values defined in the first relevant keyframe as soon as it is applied to the target
    case backwards

    /// The animation will follow the rules for both forwards and backwards, extending the animation in both directions
    case both

    /// Global value
    case global(CSSTypeTypes.Global)
}

extension AnimationFillMode: CaseIterable {
    public static let allCases: [AnimationFillMode] = [
        .none,
        .forwards,
        .backwards,
        .both
    ] + Global.allCases.compactMap(AnimationFillMode.global)
}

/// CSS Output conversion
extension AnimationFillMode: CustomStringConvertible {
    /// Converts the animation fill mode to its CSS string representation
    public var description: String {
        switch self {
        case .none: return "none"
        case .forwards: return "forwards"
        case .backwards: return "backwards"
        case .both: return "both"
        case .global(let global): return global.description
        }
    }
}
