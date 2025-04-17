import Foundation
import CSSTypeTypes

/// Represents the CSS `mask-origin` property, which sets the origin point for positioning the mask image.
///
/// This property determines the origin point for positioning the mask image: from the border start,
/// inside the border, or inside the padding. It specifies which box the mask is positioned relative to.
///
/// Visual Reference:
/// ```
/// ┌─────────────────────────────┐
/// │         border-box          │
/// │   ┌───────────────────┐     │
/// │   │   padding-box     │     │
/// │   │  ┌─────────────┐  │     │
/// │   │  │ content-box │  │     │
/// │   │  │             │  │     │
/// │   │  └─────────────┘  │     │
/// │   └───────────────────┘     │
/// └─────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position mask relative to the border box (default)
/// .maskOrigin(.borderBox)
///
/// // Position mask relative to the padding box
/// .maskOrigin(.paddingBox)
///
/// // Position mask relative to the content box
/// .maskOrigin(.contentBox)
///
/// // For SVG elements, relative to the fill box
/// .maskOrigin(.fillBox)
///
/// // For SVG elements, relative to the stroke box
/// .maskOrigin(.strokeBox)
///
/// // For SVG elements, relative to the view box
/// .maskOrigin(.viewBox)
///
/// // Different origins for multiple masks
/// .maskOrigin(.values(.contentBox, .paddingBox))
/// ```
///
/// - Note: When an element has multiple masks, each mask can have a different origin.
///
/// - SeeAlso: [MDN Web Docs on mask-origin](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-origin)
public enum MaskOrigin: Property {
    public static let property: String = "mask-origin"
    
    /// The mask is positioned relative to the border box (default)
    case borderBox
    
    /// The mask is positioned relative to the padding box
    case paddingBox
    
    /// The mask is positioned relative to the content box
    case contentBox
    
    /// For SVG elements, the mask is positioned relative to the fill box
    case fillBox
    
    /// For SVG elements, the mask is positioned relative to the stroke box
    case strokeBox
    
    /// For SVG elements, the mask is positioned relative to the view box
    case viewBox
    
    /// Multiple origin values for multiple masks
    case multiple([Origin])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Origin value type
    public enum Origin: String, Sendable, Hashable {
        /// The mask is positioned relative to the border box
        case borderBox = "border-box"
        
        /// The mask is positioned relative to the padding box
        case paddingBox = "padding-box"
        
        /// The mask is positioned relative to the content box
        case contentBox = "content-box"
        
        /// For SVG elements, the mask is positioned relative to the fill box
        case fillBox = "fill-box"
        
        /// For SVG elements, the mask is positioned relative to the stroke box
        case strokeBox = "stroke-box"
        
        /// For SVG elements, the mask is positioned relative to the view box
        case viewBox = "view-box"
    }
}

/// Provides string conversion for CSS output
extension MaskOrigin: CustomStringConvertible {
    /// Converts the mask-origin value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-origin: border-box;
    /// mask-origin: padding-box;
    /// mask-origin: content-box;
    /// mask-origin: fill-box;
    /// mask-origin: stroke-box;
    /// mask-origin: view-box;
    /// mask-origin: content-box, padding-box;
    /// ```
    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"
        case .paddingBox:
            return "padding-box"
        case .contentBox:
            return "content-box"
        case .fillBox:
            return "fill-box"
        case .strokeBox:
            return "stroke-box"
        case .viewBox:
            return "view-box"
        case .multiple(let origins):
            return origins.map { $0.rawValue }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension MaskOrigin {
    /// The default value for mask-origin (`border-box`)
    public static let `default` = MaskOrigin.borderBox
    
    /// Creates a mask-origin with multiple values
    ///
    /// - Parameter origins: The origin values
    /// - Returns: A mask-origin with multiple values
    public static func values(_ origins: [Origin]) -> MaskOrigin {
        if origins.count == 1 {
            switch origins[0] {
            case .borderBox: return .borderBox
            case .paddingBox: return .paddingBox
            case .contentBox: return .contentBox
            case .fillBox: return .fillBox
            case .strokeBox: return .strokeBox
            case .viewBox: return .viewBox
            }
        }
        return .multiple(origins)
    }
    
    /// Creates a mask-origin with multiple values
    ///
    /// - Parameter origins: The origin values
    /// - Returns: A mask-origin with multiple values
    public static func values(_ origins: Origin...) -> MaskOrigin {
        values(origins)
    }
}
