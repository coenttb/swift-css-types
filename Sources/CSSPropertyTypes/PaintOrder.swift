import Foundation
import CSSTypeTypes

/// The CSS `paint-order` property lets you control the order in which the fill and stroke 
/// (and painting markers) of text content and shapes are drawn.
///
/// By default, elements are painted in the order: fill, stroke, markers. This property allows
/// you to specify a different order.
///
/// - Note: For SVG elements, markers are appropriate when using the `marker-*` properties and
///         the `<marker>` element. For HTML text, only stroke and fill ordering can be controlled.
///
/// Example:
/// ```swift
/// .paintOrder(.normal)                           // paint-order: normal
/// .paintOrder(.stroke)                           // paint-order: stroke
/// .paintOrder(.markers)                          // paint-order: markers
/// .paintOrder([.stroke, .fill])                  // paint-order: stroke fill
/// .paintOrder([.markers, .stroke, .fill])        // paint-order: markers stroke fill
/// ```
///
/// - SeeAlso: [MDN Web Docs on paint-order](https://developer.mozilla.org/en-US/docs/Web/CSS/paint-order)
public enum PaintOrder: Property {
    public static let property: String = "paint-order"
    
    /// Default painting order (fill, stroke, markers)
    case normal
    
    /// Custom painting order with one or more specified layers
    case custom(Set<PaintLayer>)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Individual paint layers that can be ordered
    public enum PaintLayer: String, Hashable, Sendable, Equatable, CaseIterable {
        /// The fill of the element
        case fill
        
        /// The stroke (outline) of the element
        case stroke
        
        /// SVG markers (e.g., arrowheads) used with the marker-* properties
        case markers
    }
}

/// CSS Output conversion
extension PaintOrder: CustomStringConvertible {
    /// Converts the paint order to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
            
        case .custom(let layers):
            if layers.isEmpty {
                return "normal"
            }
            
            // The specification doesn't define an order for the output,
            // so we sort them to ensure consistent output
            return layers.map { $0.rawValue }.sorted().joined(separator: " ")
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for common paint orders
extension PaintOrder {
    /// Creates a paint order with a specific layer specified first.
    /// The other layers will follow in their default order.
    ///
    /// - Parameter first: The layer to paint first
    /// - Returns: A PaintOrder with the specified layer first
    public static func first(_ first: PaintLayer) -> PaintOrder {
        .custom([first])
    }
    
    /// Creates a paint order with the fill layer first
    public static let fill: PaintOrder = .first(.fill)
    
    /// Creates a paint order with the stroke layer first
    public static let stroke: PaintOrder = .first(.stroke)
    
    /// Creates a paint order with the markers layer first
    public static let markers: PaintOrder = .first(.markers)
    
    /// Creates a paint order with multiple layers in specified order
    ///
    /// - Parameter layers: The layers in the order they should be painted
    /// - Returns: A PaintOrder with the specified layers in order
    public static func order(_ layers: PaintLayer...) -> PaintOrder {
        .custom(Set(layers))
    }
}
