import Foundation
import CSSTypeTypes

/// The CSS `transform-style` property sets whether children of an element are positioned in the 3D space 
/// or are flattened in the plane of the element.
///
/// Example:
/// ```swift
/// .transformStyle(.flat)        // transform-style: flat
/// .transformStyle(.preserve3D)  // transform-style: preserve-3d
/// ```
///
/// - Note: If flattened (`flat`), the element's children will not exist on their own in the 3D-space.
/// - Note: As this property is not inherited, it must be set for all non-leaf descendants of the element.
/// - Note: Certain properties can force the element to have a `flat` transform style even when `preserve-3d` is specified, 
///         including non-default values of: overflow, opacity, filter, clip, clip-path, isolation, mask-image, 
///         mask-border-source, mix-blend-mode, and contain.
///
/// - SeeAlso: [MDN Web Docs on transform-style](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-style)
public enum TransformStyle: Property {
    
    public static let property: String = "transform-style"
    
    /// Indicates that the children of the element are lying in the plane of the element itself.
    case flat
    
    /// Indicates that the children of the element should be positioned in the 3D-space.
    case preserve3D
    
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TransformStyle: CustomStringConvertible {
    /// Converts the transform-style value to its CSS string representation
    public var description: String {
        switch self {
        case .flat:
            return "flat"
        case .preserve3D:
            return "preserve-3d"
        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods and convenience properties
extension TransformStyle {
    /// The flat value (default) - children are in the same plane as the element
    public static let defaultValue: TransformStyle = .flat
    
    /// Create a 3D scene with this element
    ///
    /// Use this to create 3D transformable elements where children maintain their position in 3D space
    ///
    /// - Returns: The transform style property with preserve-3d value
    public static func create3DScene() -> TransformStyle {
        .preserve3D
    }
    
    /// Ensures children are flattened into the element's 2D plane
    ///
    /// - Returns: The transform style property with flat value
    public static func flatten() -> TransformStyle {
        .flat
    }
}
