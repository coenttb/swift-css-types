import Foundation
import CSSTypeTypes

/// Represents the CSS `backface-visibility` property, which determines whether the back face of an element is visible when turned towards the user.
///
/// An element's back face is a mirror image of its front face. Though invisible in 2D, the back face can become
/// visible when a transformation causes the element to be rotated in 3D space. This property has no effect on
/// 2D transforms, which have no perspective.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     3D Cube with          │  │     3D Cube with          │
/// │     backface-visibility:  │  │     backface-visibility:  │
/// │     visible               │  │     hidden                │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Hide the back face of an element
/// .backfaceVisibility(.hidden)
///
/// // Make the back face visible (default)
/// .backfaceVisibility(.visible)
/// ```
///
/// - Note: This property is often used with 3D transforms to prevent elements from showing their back side when rotated.
///
/// - SeeAlso: [MDN Web Docs on backface-visibility](https://developer.mozilla.org/en-US/docs/Web/CSS/backface-visibility)
public enum BackfaceVisibility: Property {
    public static let property: String = "backface-visibility"
    
    /// The back face is visible when turned towards the user (default)
    case visible
    
    /// The back face is hidden, effectively making the element invisible when turned away from the user
    case hidden
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BackfaceVisibility: CustomStringConvertible {
    /// Converts the backface-visibility value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// backface-visibility: visible;
    /// backface-visibility: hidden;
    /// ```
    public var description: String {
        switch self {
        case .visible:
            return "visible"
        case .hidden:
            return "hidden"
        case .global(let global):
            return global.description
        }
    }
}

/// Default value
extension BackfaceVisibility {
    /// The default value for backface-visibility (`visible`)
    public static let `default` = BackfaceVisibility.visible
}
