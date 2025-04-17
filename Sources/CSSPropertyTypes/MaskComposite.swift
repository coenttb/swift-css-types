import Foundation
import CSSTypeTypes

/// Represents the CSS `mask-composite` property, which sets how the current mask layer interacts with the mask layers below it.
///
/// This property specifies the compositing operation to be performed when multiple mask layers are present. The operation
/// determines how the current mask layer combines with the mask layers that have already been specified.
///
/// Visual Reference:
/// ```
/// Original Masks:      Composite Results:
/// ┌───────────────┐    ┌───────────────┐    ┌───────────────┐
/// │    ┌───┐      │    │    ┌───┐      │    │    ┌───┐      │
/// │    │ A │      │    │    │   │      │    │    │///│      │
/// │    └───┘      │    │    └───┘      │    │    └───┘      │
/// │          ┌───┐│    │          ┌───┐│    │          ┌───┐│
/// │          │ B ││    │          │   ││    │          │///││
/// │          └───┘│    │          └───┘│    │          └───┘│
/// └───────────────┘    └───────────────┘    └───────────────┘
///                       add (A + B)           subtract (A - B)
/// 
/// ┌───────────────┐    ┌───────────────┐
/// │    ┌───┐      │    │    ┌───┐      │
/// │    │///│      │    │    │   │      │
/// │    └───┘      │    │    └───┘      │
/// │          ┌───┐│    │          ┌───┐│
/// │          │///││    │          │   ││
/// │          └───┘│    │          └───┘│
/// └───────────────┘    └───────────────┘
///  intersect (A ∩ B)    exclude (A xor B)
/// ```
///
/// Example:
/// ```swift
/// // Add the current mask layer to previous ones (default)
/// .maskComposite(.add)
///
/// // Subtract the current mask layer from previous ones
/// .maskComposite(.subtract)
///
/// // Keep only the areas where both current and previous mask layers are visible
/// .maskComposite(.intersect)
///
/// // Keep only the areas where either the current or previous mask layers are visible, but not both
/// .maskComposite(.exclude)
///
/// // Specify different composite operations for multiple masks
/// .maskComposite([.add, .subtract, .intersect])
/// ```
///
/// - Note: When using multiple masks, each individual mask is composited with the result of the previous masks
///         according to the specified compositing operation.
///
/// - SeeAlso: [MDN Web Docs on mask-composite](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-composite)
public enum MaskComposite: Property {
    public static let property: String = "mask-composite"
    
    /// Add current mask layer to previous mask layers
    case add
    
    /// Subtract current mask layer from previous mask layers
    case subtract
    
    /// Intersect current mask layer with previous mask layers
    case intersect
    
    /// Areas covered by both the current and previous mask layers are not shown
    case exclude
    
    /// Multiple composite operations for multiple mask layers
    case multiple([CompositeOperation])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Composite operation for mask layers
    public enum CompositeOperation: String, Sendable, Hashable {
        /// Add current mask layer to previous mask layers
        case add
        
        /// Subtract current mask layer from previous mask layers
        case subtract
        
        /// Intersect current mask layer with previous mask layers
        case intersect
        
        /// Areas covered by both the current and previous mask layers are not shown
        case exclude
    }
}

/// Provides string conversion for CSS output
extension MaskComposite: CustomStringConvertible {
    /// Converts the mask-composite value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-composite: add;
    /// mask-composite: subtract;
    /// mask-composite: intersect;
    /// mask-composite: exclude;
    /// mask-composite: add, subtract, intersect;
    /// ```
    public var description: String {
        switch self {
        case .add:
            return "add"
        case .subtract:
            return "subtract"
        case .intersect:
            return "intersect"
        case .exclude:
            return "exclude"
        case .multiple(let operations):
            return operations.map { $0.rawValue }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension MaskComposite {
    /// The default value for mask-composite (`add`)
    public static let `default` = MaskComposite.add
    
    /// Creates a mask-composite with multiple operations
    ///
    /// - Parameter operations: The composite operations
    /// - Returns: A mask-composite with multiple operations
    public static func values(_ operations: [CompositeOperation]) -> MaskComposite {
        if operations.count == 1 {
            switch operations[0] {
            case .add: return .add
            case .subtract: return .subtract
            case .intersect: return .intersect
            case .exclude: return .exclude
            }
        }
        return .multiple(operations)
    }
    
    /// Creates a mask-composite with multiple operations
    ///
    /// - Parameter operations: The composite operations
    /// - Returns: A mask-composite with multiple operations
    public static func values(_ operations: CompositeOperation...) -> MaskComposite {
        values(operations)
    }
}
