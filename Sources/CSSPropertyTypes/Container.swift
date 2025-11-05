import CSSTypeTypes
import Foundation

/// The `container` CSS shorthand property establishes an element as a query container and specifies
/// the name and type of the containment context used in a container query.
///
/// This property is a shorthand for:
/// - `container-name`
/// - `container-type`
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/container)
public enum Container: Property {
    public static let property: String = "container"

    /// Only a container name
    case name(Ident)

    /// A container name with a specific type
    case nameWithType(name: Ident, type: ContainerType)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .name(let name):
            return name.description
        case .nameWithType(let name, let type):
            return "\(name) / \(type)"
        case .global(let value):
            return value.description
        }
    }
}
