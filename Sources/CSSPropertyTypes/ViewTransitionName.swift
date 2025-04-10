import Foundation
import CSSTypeTypes

/// The CSS view-transition-name property provides the selected element with a distinct identifying name
/// and causes it to participate in a separate view transition from the root view transition.
///
/// If the value is set to 'none', the element will not participate in a view transition.
///
/// Example:
/// ```swift
/// .viewTransitionName(.custom("header"))       // view-transition-name: header
/// .viewTransitionName(.custom("figure-caption")) // view-transition-name: figure-caption
/// .viewTransitionName(.none)                   // view-transition-name: none
/// ```
///
/// - Note: If two rendered elements have the same view-transition-name at the same time,
///         ViewTransition.ready will reject and the transition will be skipped.
///
/// - SeeAlso: [MDN Web Docs on view-transition-name](https://developer.mozilla.org/en-US/docs/Web/CSS/view-transition-name)
public enum ViewTransitionName: Property {
    
    public static let property: String = "view-transition-name"
    
    /// The element will not participate in a view transition
    case none
    
    /// An identifying name that causes the element to participate in a separate view transition
    case custom(CustomIdent)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ViewTransitionName: CustomStringConvertible {
    /// Converts the view-transition-name value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .custom(let ident):
            return ident.description
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension ViewTransitionName {
    /// Creates a custom view transition name
    ///
    /// - Parameter name: The name to use for the view transition
    /// - Returns: A ViewTransitionName with the specified custom identifier
    public static func custom(_ name: String) -> Self {
        return .custom(CustomIdent(name))
    }
}
