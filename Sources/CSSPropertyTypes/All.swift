//import Foundation
//import CSSTypeTypes
//
///// The all shorthand CSS property resets all of an element's properties except 
///// unicode-bidi, direction, and CSS Custom Properties.
/////
///// It can set properties to their initial or inherited values, or to the values 
///// specified in another cascade layer or stylesheet origin.
/////
///// Note: This property is a shorthand for all CSS properties except for unicode-bidi, 
///// direction, and custom properties.
/////
///// Example:
///// ```swift
///// .all(.initial)        // all: initial
///// .all(.inherit)        // all: inherit
///// .all(.unset)          // all: unset
///// .all(.revert)         // all: revert
///// ```
/////
///// - SeeAlso: [MDN Web Docs on all](https://developer.mozilla.org/en-US/docs/Web/CSS/all)
//public enum All: Property {
//    public static let property: String = "all"
//    
//    /// Sets all properties to their initial values
//    case initial
//    
//    /// Sets all properties to their inherited values
//    case inherit
//    
//    /// Sets all properties to their inherited values if they inherit by default, or to their initial values if not
//    case unset
//    
//    /// Resets all properties to the values established by the user-agent and user stylesheets
//    case revert
//    
//    /// Resets all properties to the values from a previous cascade layer
//    case revertLayer
//}
//
///// CSS Output conversion
//extension All: CustomStringConvertible {
//    /// Converts the property value to its CSS string representation
//    public var description: String {
//        switch self {
//        case .initial:
//            return "initial"
//        case .inherit:
//            return "inherit"
//        case .unset:
//            return "unset"
//        case .revert:
//            return "revert"
//        case .revertLayer:
//            return "revert-layer"
//        }
//    }
//}
