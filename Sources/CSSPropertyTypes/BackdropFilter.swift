import Foundation
import CSSTypeTypes

/// Represents the CSS `backdrop-filter` property, which applies filter effects to the area behind an element.
///
/// The backdrop-filter property allows you to apply graphical effects like blurring, color shifting,
/// or color inversion to the area behind an element. Because it applies to everything behind the element,
/// to see the effect the element or its background needs to be transparent or partially transparent.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     Element with no       │  │     Element with          │
/// │     backdrop filter       │  │     backdrop-filter: blur │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     Element with          │  │     Element with          │
/// │     backdrop-filter:      │  │     backdrop-filter:      │
/// │     brightness            │  │     grayscale             │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Apply a single backdrop filter
/// .backdropFilter(.blur(.px(5)))
///
/// // Apply multiple backdrop filters (applied from left to right)
/// .backdropFilter(
///     .blur(.px(2)),
///     .brightness(1.2),
///     .contrast(1.1)
/// )
///
/// // Create a frosted-glass effect
/// .backdropFilter(.blur(.px(8)))
/// .backgroundColor(.rgba(255, 255, 255, 0.3))
/// ```
///
/// - Note: For the backdrop-filter to work, the element or its background needs to have some level of transparency.
///
/// - SeeAlso: [MDN Web Docs on backdrop-filter](https://developer.mozilla.org/en-US/docs/Web/CSS/backdrop-filter)
public enum BackdropFilter: Property {
    
    public static let property: String = "backdrop-filter"
    
    /// No filter effect
    case none
    
    /// A single filter function
    case filter(FilterFunction)
    
    /// Multiple filter functions
    case filters([FilterFunction])
    
    /// SVG filter URL reference
    case url(Url)
    
    /// Combined filters (URL + functions)
    case combined(url: String, filters: [FilterFunction])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
//    /// Creates a backdrop filter with no effect
//    public static var none: BackdropFilter {
//        return .none
//    }
//    
//    /// Creates a backdrop filter with an array of filter functions
//    ///
//    /// - Parameter filters: Array of filter functions to apply
//    /// - Returns: A backdrop filter with the specified filters
//    public static func filters(_ filters: [FilterFunction]) -> BackdropFilter {
//        return filters.isEmpty ? .none : (filters.count == 1 ? .filter(filters[0]) : .filters(filters))
//    }
    
    /// Creates a backdrop filter with one or more filter functions
    ///
    /// - Parameter filters: One or more filter functions to apply
    /// - Returns: A backdrop filter with the specified filters
    public static func filters(_ filters: FilterFunction...) -> BackdropFilter {
        return Self.filters(filters)
    }
    
//    /// Creates a combined filter with URL and filter functions
//    ///
//    /// - Parameters:
//    ///   - url: SVG filter URL reference
//    ///   - filters: Array of filter functions to apply after the URL filter
//    /// - Returns: A backdrop filter with URL and filter functions
//    public static func combined(url: String, filters: [FilterFunction]) -> BackdropFilter {
//        if filters.isEmpty {
//            return .url(url)
//        } else {
//            return .combined(url: url, filters: filters)
//        }
//    }
}

/// Provides string conversion for CSS output
extension BackdropFilter: CustomStringConvertible {
    /// Converts the backdrop filter to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// backdrop-filter: blur(5px) brightness(120%) contrast(110%);
    /// backdrop-filter: none;
    /// backdrop-filter: url(filters.svg#filter);
    /// backdrop-filter: url(filters.svg#filter) blur(4px) saturate(150%);
    /// backdrop-filter: inherit;
    /// ```
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
        case .combined(let url, let filters):
            let filterString = filters.map { $0.description }.joined(separator: " ")
            return "url(\(url)) \(filterString)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for common backdrop filter styles
extension BackdropFilter {
    /// Creates a backdrop filter with a blur effect
    ///
    /// - Parameter radius: The blur radius
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.blur(.px(5))) // 5px blur
    /// ```
    public static func blur(_ radius: Length) -> BackdropFilter {
        .filter(.blur(radius))
    }
    
    /// Creates a backdrop filter that adjusts brightness
    ///
    /// - Parameter amount: Brightness multiplier (1.0 = normal, 0.5 = 50% darker, 2.0 = 100% brighter)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.brightness(1.5)) // 50% brighter
    /// ```
    public static func brightness(_ amount: Double) -> BackdropFilter {
        .filter(.brightness(amount))
    }
    
    /// Creates a backdrop filter that adjusts contrast
    ///
    /// - Parameter amount: Contrast multiplier (1.0 = normal, 0.5 = 50% less contrast, 2.0 = 100% more contrast)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.contrast(1.2)) // 20% more contrast
    /// ```
    public static func contrast(_ amount: Double) -> BackdropFilter {
        .filter(.contrast(amount))
    }
    
    /// Creates a backdrop filter that applies a drop shadow
    ///
    /// - Parameters:
    ///   - offsetX: Horizontal offset of the shadow
    ///   - offsetY: Vertical offset of the shadow
    ///   - blurRadius: Blur radius of the shadow
    ///   - color: Color of the shadow
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.dropShadow(
    ///     offsetX: .px(2),
    ///     offsetY: .px(4),
    ///     blurRadius: .px(6),
    ///     color: .rgba(0, 0, 0, 0.5)
    /// ))
    /// ```
    public static func dropShadow(offsetX: Length, offsetY: Length, blurRadius: Length?, color: Color?) -> BackdropFilter {
        .filter(.dropShadow(offsetX: offsetX, offsetY: offsetY, blurRadius: blurRadius, color: color))
    }
    
    /// Creates a backdrop filter that applies a grayscale effect
    ///
    /// - Parameter amount: Intensity of the effect (0.0 = no effect, 1.0 = full grayscale)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.grayscale(0.5)) // 50% grayscale
    /// ```
    public static func grayscale(_ amount: Double) -> BackdropFilter {
        .filter(.grayscale(amount))
    }
    
    /// Creates a backdrop filter that rotates colors along the hue spectrum
    ///
    /// - Parameter angle: The angle of rotation on the color wheel
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.hueRotate(.deg(180))) // 180-degree hue rotation
    /// ```
    public static func hueRotate(_ angle: Angle) -> BackdropFilter {
        .filter(.hueRotate(angle))
    }
    
    /// Creates a backdrop filter that inverts the colors
    ///
    /// - Parameter amount: Intensity of the effect (0.0 = no effect, 1.0 = fully inverted)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.invert(1.0)) // Completely inverted colors
    /// ```
    public static func invert(_ amount: Double) -> BackdropFilter {
        .filter(.invert(amount))
    }
    
    /// Creates a backdrop filter that adjusts opacity
    ///
    /// - Parameter amount: Opacity level (0.0 = transparent, 1.0 = fully opaque)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.opacity(0.7)) // 70% opacity
    /// ```
    public static func opacity(_ amount: Double) -> BackdropFilter {
        .filter(.opacity(amount))
    }
    
    /// Creates a backdrop filter that adjusts color saturation
    ///
    /// - Parameter amount: Saturation multiplier (0.0 = grayscale, 1.0 = normal, 2.0 = highly saturated)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.saturate(1.5)) // 50% more saturation
    /// ```
    public static func saturate(_ amount: Double) -> BackdropFilter {
        .filter(.saturate(amount))
    }
    
    /// Creates a backdrop filter that applies a sepia tone effect
    ///
    /// - Parameter amount: Intensity of the effect (0.0 = no effect, 1.0 = full sepia)
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.sepia(0.8)) // 80% sepia tone
    /// ```
    public static func sepia(_ amount: Double) -> BackdropFilter {
        .filter(.sepia(amount))
    }
    
    /// Creates a backdrop filter with a URL and additional filter functions
    ///
    /// - Parameters:
    ///   - url: SVG filter URL reference
    ///   - filters: Filter functions to apply after the URL filter
    ///
    /// Example:
    /// ```swift
    /// .backdropFilter(.urlWithFilters("filters.svg#myFilter", [.blur(.px(4)), .saturate(1.5)]))
    /// ```
    public static func urlWithFilters(_ url: String, _ filters: [FilterFunction]) -> BackdropFilter {
        return .combined(url: url, filters: filters)
    }
}
