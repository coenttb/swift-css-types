import Foundation
import CSSTypeTypes

/// The CSS animation-play-state property sets whether an animation is running or paused.
///
/// Resuming a paused animation will start the animation from where it left off at the time it was paused,
/// rather than starting over from the beginning of the animation sequence.
///
/// Example:
/// ```swift
/// .animationPlayState(.running)      // animation-play-state: running
/// .animationPlayState(.paused)       // animation-play-state: paused
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-play-state](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state)
public enum AnimationPlayState: Property {
    public static let property: String = "animation-play-state"
    /// The animation is currently playing (default)
    case running
    
    /// The animation is currently paused
    case paused
    
    /// Global value
    case global(CSSTypeTypes.Global)
}

extension AnimationPlayState: CaseIterable {
    public static let allCases: [AnimationPlayState] = [.running, .paused] + Global.allCases.map { AnimationPlayState.global($0) }
}

/// CSS Output conversion
extension AnimationPlayState: CustomStringConvertible {
    /// Converts the animation play state to its CSS string representation
    public var description: String {
        switch self {
        case .running:
            return "running"
        case .paused:
            return "paused"
        case .global(let global):
            return global.description
        }
    }
}
