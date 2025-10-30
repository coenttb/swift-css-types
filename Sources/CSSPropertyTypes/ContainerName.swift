import CSSTypeTypes
import Foundation

/// The `container-name` CSS property specifies a list of query container names used by
/// the `@container` at-rule in a container query.
///
/// A container query applies styles to elements based on the size or scroll-state of the
/// nearest ancestor with a containment context. When a containment context is given a name,
/// it can be specifically targeted using the `@container` at-rule.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/container-name)
public enum ContainerName: Property {
  public static let property: String = "container-name"

  /// Default value. The query container has no name.
  case none

  /// A single container name
  case name(Ident)

  /// Multiple container names
  case names([Ident])

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .name(let name):
      return name.description
    case .names(let names):
      return names.map { $0.description }.joined(separator: " ")
    case .global(let value):
      return value.description
    }
  }
}
