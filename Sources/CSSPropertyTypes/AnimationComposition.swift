import CSSTypeTypes
import Foundation

/// The CSS animation-composition property specifies the composite operation
/// to use when multiple animations affect the same property simultaneously.
///
/// Example:
/// ```swift
/// .animationComposition(.replace)      // animation-composition: replace
/// .animationComposition(.add)          // animation-composition: add
/// .animationComposition(.accumulate)   // animation-composition: accumulate
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-composition](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-composition)
public enum AnimationComposition: Property {

    public static let property: String = "animation-composition"

    /// The effect value overrides the underlying value of the property (default)
    case replace

    /// The effect value builds on the underlying value of the property
    case add

    /// The effect and underlying values are combined
    case accumulate

    /// Global values
    case global(CSSTypeTypes.Global)
}

extension AnimationComposition: CaseIterable {
    public static let allCases: [AnimationComposition] =
        [.replace, .add, .accumulate] + Global.allCases.map(AnimationComposition.global)
}

/// CSS Output conversion
extension AnimationComposition: CustomStringConvertible {
    /// Converts the animation composition to its CSS string representation
    public var description: String {
        switch self {
        case .replace:
            return "replace"
        case .add:
            return "add"
        case .accumulate:
            return "accumulate"
        case .global(let global):
            return global.description
        }
    }
}
