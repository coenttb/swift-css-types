import Foundation
import CSSTypeTypes

/// The CSS anchor-name property enables defining an element as an anchor element by
/// giving it one or more identifying anchor names.
///
/// Each name can then be set as the value of a positioned element's position-anchor 
/// property to associate it with the anchor.
///
/// Example:
/// ```swift
/// .anchorName(.none)                        // anchor-name: none
/// .anchorName(.custom("--myAnchor"))        // anchor-name: --myAnchor
/// .anchorName([.custom("--a"), .custom("--b")])  // anchor-name: --a, --b
/// ```
///
/// - Note: This is an experimental property and browser support may be limited.
///
/// - SeeAlso: [MDN Web Docs on anchor-name](https://developer.mozilla.org/en-US/docs/Web/CSS/anchor-name)
public enum AnchorName: Property {
    
    public static let property: String = "anchor-name"
    
    /// No anchor name defined (default)
    case none
    
    /// A single anchor name identifier
    case single(DashedIdent)
    
    /// Multiple anchor name identifiers
    case multiple([DashedIdent])
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension AnchorName: CustomStringConvertible {
    /// Converts the anchor name to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .single(let ident):
            return ident.description
            
        case .multiple(let idents):
            return idents.map { $0.description }.joined(separator: ", ")
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension AnchorName {
    /// Creates a single custom anchor name
    public static func custom(_ name: String) -> Self {
        return .single(DashedIdent(name))
    }
    
    /// Creates multiple custom anchor names
    public static func customs(_ names: [String]) -> Self {
        return .multiple(names.map { DashedIdent($0) })
    }
}
