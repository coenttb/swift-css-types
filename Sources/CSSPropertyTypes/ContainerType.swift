import Foundation
import CSSTypeTypes

/// The `container-type` CSS property defines the type of container context used in a container query.
///
/// Container queries allow you to apply styles based on the size of a containing element rather than the viewport.
/// The `container-type` property is used to define which type of containment context is used in the container query.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/container-type)
public enum ContainerType: Property, GlobalConvertible {
    public static let property: String = "container-type"
    
    /// Default value. The element is not a query container for any container size queries,
    /// but remains a query container for container style queries.
    case normal
    
    /// Establishes a query container for dimensional queries on the inline axis of the container.
    /// Applies layout, style, and inline-size containment to the element.
    case inlineSize
    
    /// Establishes a query container for container size queries in both the inline and block dimensions.
    /// Applies layout containment, style containment, and size containment to the container.
    case size
    
    /// Establishes a query container for scroll-state queries on the container.
    /// In this case, the size of the element is not computed in isolation; no containment is applied.
    case scrollState
    
    /// Container size queries with scroll-state queries
    case sizeScrollState
    
    /// Inline size queries with scroll-state queries
    case inlineSizeScrollState
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .inlineSize:
            return "inline-size"
        case .size:
            return "size"
        case .scrollState:
            return "scroll-state"
        case .sizeScrollState:
            return "size scroll-state"
        case .inlineSizeScrollState:
            return "inline-size scroll-state"
        case .global(let value):
            return value.description
        }
    }
}
