import Foundation
import CSSTypeTypes

/// Represents the CSS `mask-mode` property, which sets whether the mask image is treated as a luminance or alpha mask.
///
/// This property determines how the values in the mask image are interpreted when creating the mask. It allows
/// you to specify whether the transparency (alpha channel) or the luminance values of the mask image should be
/// used as the mask values.
///
/// Visual Reference:
/// ```
/// Original Image:            Alpha Mask:             Luminance Mask:
/// ┌───────────────────┐      ┌───────────────────┐   ┌───────────────────┐
/// │  █████            │      │  ░░░░░            │   │  █████            │
/// │  █   █            │      │  █   █            │   │                   │
/// │  █████            │      │  ░░░░░            │   │  █████            │
/// │  █                │      │  █                │   │                   │
/// │  █                │      │  █                │   │                   │
/// └───────────────────┘      └───────────────────┘   └───────────────────┘
///                        Alpha uses transparency    Luminance uses brightness
/// ```
///
/// Example:
/// ```swift
/// // Use the alpha channel of the mask image (transparent areas become holes in the mask)
/// .maskMode(.alpha)
///
/// // Use the luminance values of the mask image (darker areas become more transparent)
/// .maskMode(.luminance)
///
/// // Automatically determine based on mask image type (default)
/// .maskMode(.matchSource)
///
/// // Different modes for multiple mask layers
/// .maskMode([.alpha, .luminance, .matchSource])
/// ```
///
/// - Note: When set to `match-source`, images use alpha channel masking and SVG masks use luminance masking.
///         This is often the most intuitive behavior for each mask type.
///
/// - SeeAlso: [MDN Web Docs on mask-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-mode)
public enum MaskMode: Property {
    public static let property: String = "mask-mode"
    /// Use the alpha channel of the mask image
    case alpha
    
    /// Use the luminance values of the mask image
    case luminance
    
    /// Use alpha for images, luminance for SVG masks (default)
    case matchSource
    
    /// Multiple mode values for multiple mask layers
    case multiple([MaskingMode])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Masking mode value
    public enum MaskingMode: String, Sendable, Hashable {
        /// Use the alpha channel of the mask image
        case alpha
        
        /// Use the luminance values of the mask image
        case luminance
        
        /// Use alpha for images, luminance for SVG masks
        case matchSource = "match-source"
    }
}

/// Provides string conversion for CSS output
extension MaskMode: CustomStringConvertible {
    /// Converts the mask-mode value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-mode: alpha;
    /// mask-mode: luminance;
    /// mask-mode: match-source;
    /// mask-mode: alpha, luminance, match-source;
    /// ```
    public var description: String {
        switch self {
        case .alpha:
            return "alpha"
        case .luminance:
            return "luminance"
        case .matchSource:
            return "match-source"
        case .multiple(let modes):
            return modes.map { $0.rawValue }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension MaskMode {
    /// The default value for mask-mode (`match-source`)
    public static let `default` = MaskMode.matchSource
    
    /// Creates a mask-mode with multiple values
    ///
    /// - Parameter modes: The masking mode values
    /// - Returns: A mask-mode with multiple values
    public static func values(_ modes: [MaskingMode]) -> MaskMode {
        if modes.count == 1 {
            switch modes[0] {
            case .alpha: return .alpha
            case .luminance: return .luminance
            case .matchSource: return .matchSource
            }
        }
        return .multiple(modes)
    }
    
    /// Creates a mask-mode with multiple values
    ///
    /// - Parameter modes: The masking mode values
    /// - Returns: A mask-mode with multiple values
    public static func values(_ modes: MaskingMode...) -> MaskMode {
        values(modes)
    }
}
