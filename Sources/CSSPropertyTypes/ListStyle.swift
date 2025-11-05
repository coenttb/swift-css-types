import CSSTypeTypes
import Foundation

/// The CSS `list-style` property is a shorthand that sets the list-style-type, list-style-position,
/// and list-style-image properties in a single declaration.
///
/// This property controls the appearance and position of list item markers and whether an image is used
/// as the list marker. When using this shorthand, unspecified properties are set to their initial values.
///
/// Example:
/// ```swift
/// .listStyle(.none)                                  // list-style: none
/// .listStyle(.type(.disc))                          // list-style: disc
/// .listStyle(.position(.inside))                    // list-style: inside
/// .listStyle(.image(.url("bullet.png")))            // list-style: url("bullet.png")
/// .listStyle(.combined(type: .square,
///                      position: .inside,
///                      image: nil))                  // list-style: square inside
/// .listStyle(.global(.inherit))                     // list-style: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on list-style](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style)
public enum ListStyle: Property {
    public static let property: String = "list-style"
    /// Specifies just the list-style-type
    case type(ListStyleType)

    /// Specifies just the list-style-position
    case position(ListStylePosition)

    /// Specifies just the list-style-image
    case image(ListStyleImage)

    /// Combines multiple list style properties
    /// Type, position, and image are all optional and will use their default values if nil
    case combined(type: ListStyleType?, position: ListStylePosition?, image: ListStyleImage?)

    /// A special value that disables all list styling
    case none

    /// Global values
    case global(CSSTypeTypes.Global)

    // MARK: - CustomStringConvertible

    public var description: String {
        switch self {
        case .type(let type):
            return type.description
        case .position(let position):
            return position.description
        case .image(let image):
            return image.description
        case .combined(let type, let position, let image):
            var parts: [String] = []

            if let type = type {
                parts.append(type.description)
            }

            if let position = position {
                parts.append(position.description)
            }

            if let image = image {
                parts.append(image.description)
            }

            return parts.isEmpty ? "initial" : parts.joined(separator: " ")
        case .none:
            return "none"
        case .global(let global):
            return global.description
        }
    }
}

// MARK: - Convenience initializers

extension ListStyle {
    /// Create a list style with the specified type
    public static func disc() -> ListStyle {
        return .type(.disc)
    }

    /// Create a list style with the specified type and position
    public static func disc(position: ListStylePosition) -> ListStyle {
        return .combined(type: .disc, position: position, image: nil)
    }

    /// Create a list style with the specified type and image
    public static func withImage(_ url: Url) -> ListStyle {
        return .image(.url(url))
    }

    /// Create a numbered list style
    public static func decimal() -> ListStyle {
        return .type(.decimal)
    }

    /// Create a numbered list style with specified position
    public static func decimal(position: ListStylePosition) -> ListStyle {
        return .combined(type: .decimal, position: position, image: nil)
    }
}
