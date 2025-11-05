import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-border-mode` property, which specifies the blending mode used in a mask border.
///
/// This property defines how the source image's values are interpreted when creating the mask.
/// It determines whether the alpha channel or the luminance values of the image are used to create
/// the mask.
///
/// Example:
/// ```swift
/// // Use alpha channel values as the mask
/// .maskBorderMode(.alpha)
///
/// // Use luminance values as the mask
/// .maskBorderMode(.luminance)
/// ```
///
/// - Note: When `alpha` mode is used, transparent areas of the mask border image are used
///         to mask the element. When `luminance` mode is used, darker areas of the
///         mask border image will create more transparency in the element.
///
/// - SeeAlso: [MDN Web Docs on mask-border-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-mode)
public enum MaskBorderMode: Property {
    public static let property: String = "mask-border-mode"

    /// The alpha values of the mask border image are used as the mask values
    case alpha

    /// The luminance values of the mask border image are used as the mask values
    case luminance

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Default value (alpha)
    public static let `default` = MaskBorderMode.alpha

    /// String representation of the mask-border-mode
    public var description: String {
        switch self {
        case .alpha:
            return "alpha"
        case .luminance:
            return "luminance"
        case .global(let global):
            return global.description
        }
    }
}
