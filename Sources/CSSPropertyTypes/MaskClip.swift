import Foundation
import CSSTypeTypes

/// Represents the CSS `mask-clip` property, which determines the area which is affected by the mask.
///
/// This property sets whether an element's mask extends to its border box, padding box, content box, or
/// other specific regions related to SVG elements.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │     ┌─────────────┐       │  │     ┌─────────────┐       │
/// │     │             │       │  │     │             │       │
/// │     │  content    │       │  │     │  padding    │       │
/// │     │             │       │  │     │             │       │
/// │     └─────────────┘       │  │     └─────────────┘       │
/// │          border           │  │          border           │
/// └───────────────────────────┘  └───────────────────────────┘
///     mask-clip:                    mask-clip:
///     border-box                    padding-box
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │     ┌─────────────┐       │  │     ┌─────────────┐       │
/// │     │ ▓▓▓▓▓▓▓▓▓▓▓ │       │  │     │             │       │
/// │     │ ▓content▓▓▓ │       │  │     │             │       │
/// │     │ ▓▓▓▓▓▓▓▓▓▓▓ │       │  │     │             │       │
/// │     └─────────────┘       │  │     └─────────────┘       │
/// │          border           │  │          border           │
/// └───────────────────────────┘  └───────────────────────────┘
///     mask-clip:                    mask-clip:
///     content-box                   margin-box
/// ```
///
/// Example:
/// ```swift
/// // Clip mask to the border box (default)
/// .maskClip(.borderBox)
///
/// // Clip mask to the padding box
/// .maskClip(.paddingBox)
///
/// // Clip mask to the content box
/// .maskClip(.contentBox)
///
/// // Clip mask to the margin box
/// .maskClip(.marginBox)
///
/// // For SVG elements, clip to the fill box
/// .maskClip(.fillBox)
///
/// // For SVG elements, clip to the stroke box
/// .maskClip(.strokeBox)
///
/// // For SVG elements, clip to the view box
/// .maskClip(.viewBox)
///
/// // Don't clip the mask
/// .maskClip(.noClip)
///
/// // Different clips for multiple masks
/// .maskClip(.values(.contentBox, .borderBox))
/// ```
///
/// - Note: For inline elements, the padding box and border box are the same size.
///
/// - SeeAlso: [MDN Web Docs on mask-clip](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-clip)
public enum MaskClip: Property {
    public static let property: String = "mask-clip"
    
    /// The mask extends to the outside edge of the border (default)
    case borderBox
    
    /// The mask extends to the outside edge of the padding
    case paddingBox
    
    /// The mask is painted within the content box
    case contentBox
    
    /// The mask extends to the outside edge of the margin
    case marginBox
    
    /// For SVG elements, the mask is painted within the fill box
    case fillBox
    
    /// For SVG elements, the mask is painted within the stroke box
    case strokeBox
    
    /// For SVG elements, the mask is painted within the view box
    case viewBox
    
    /// No clipping is applied to the mask
    case noClip
    
    /// Multiple clip values for multiple masks
    case multiple([MaskClip])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension MaskClip: CustomStringConvertible {
    /// Converts the mask-clip value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-clip: border-box;
    /// mask-clip: content-box;
    /// mask-clip: margin-box;
    /// mask-clip: no-clip;
    /// mask-clip: content-box, border-box;
    /// ```
    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"
        case .paddingBox:
            return "padding-box"
        case .contentBox:
            return "content-box"
        case .marginBox:
            return "margin-box"
        case .fillBox:
            return "fill-box"
        case .strokeBox:
            return "stroke-box"
        case .viewBox:
            return "view-box"
        case .noClip:
            return "no-clip"
        case .multiple(let clips):
            return clips.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension MaskClip {
    /// The default value for mask-clip (`border-box`)
    public static let `default` = MaskClip.borderBox
    
    /// Creates a mask-clip with multiple values
    ///
    /// - Parameter clips: The mask clip values
    /// - Returns: A mask-clip with multiple values
    public static func values(_ clips: [MaskClip]) -> MaskClip {
        if clips.count == 1, case let clip = clips[0] {
            return clip
        }
        return .multiple(clips)
    }
    
    /// Creates a mask-clip with multiple values
    ///
    /// - Parameter clips: The mask clip values
    /// - Returns: A mask-clip with multiple values
    public static func values(_ clips: MaskClip...) -> MaskClip {
        values(clips)
    }
}
