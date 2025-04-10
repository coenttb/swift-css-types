import Foundation
import CSSTypeTypes

/// The CSS `list-style-image` property sets an image to be used as the list item marker.
///
/// This property specifies an image to be used in place of the standard list item marker (bullet,
/// number, etc.). It allows you to customize the appearance of list markers with images of your choice.
///
/// Example:
/// ```swift
/// .listStyleImage(.none)                   // list-style-image: none
/// .listStyleImage(.url("bullet.png"))      // list-style-image: url("bullet.png")
/// .listStyleImage(.global(.inherit))       // list-style-image: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on list-style-image](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-image)
public enum ListStyleImage: Property {
    public static let property: String = "list-style-image"
    /// No image is used; the standard list item marker is displayed
    case none
    
    /// An image to be used as the list item marker
    case image(Image)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .image(let image):
            return image.description
        case .global(let global):
            return global.description
        }
    }
}

// MARK: - Factory Methods

extension ListStyleImage {
    /// Creates a list-style-image using a URL
    public static func url(_ url: Url) -> ListStyleImage {
        return .image(.url(url))
    }
    
    /// Creates a list-style-image using a linear gradient
    public static func linearGradient(_ stops: [Color]) -> ListStyleImage {
        return .image(.linearGradient(stops))
    }
}
