import Foundation
import CSSTypeTypes

/// The CSS `filter` property applies graphical effects like blur, saturate, or hue rotation to an element.
///
/// Filters are commonly used for adjusting the rendering of images, backgrounds, and borders.
/// Multiple filters can be applied to an element by providing an array of filter functions.
///
/// Example:
/// ```swift
/// .filter([.blur(5.px), .contrast(1.5)])  // Apply blur and increase contrast
/// .filter(.dropShadow(offsetX: 2.px, offsetY: 2.px, blurRadius: 4.px, color: .black))  // Shadow effect
/// .filter(.global(.inherit))  // Inherit filters from parent
/// ```
///
/// - SeeAlso: [MDN Web Docs on filter](https://developer.mozilla.org/en-US/docs/Web/CSS/filter)
public enum Filter: Property {
    public static let property: String = "filter"
    /// No filter effect is applied
    case none
    
    /// A single filter function
    case filter(FilterFunction)
    
    /// Multiple filter functions applied in sequence
    case filters([FilterFunction])
    
    /// A URL reference to an SVG filter
    case url(Url)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .filter(let filter):
            return filter.description
        case .filters(let filters):
            return filters.map { $0.description }.joined(separator: " ")
        case .url(let url):
            return url.description
        case .global(let value):
            return value.description
        }
    }
}
