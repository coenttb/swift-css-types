import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-size` property, which sets the size of mask images.
///
/// This property controls how mask images are sized within their containing area.
/// Images can be displayed at their natural size, stretched, constrained, or scaled to fit the space.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │           ■■■             │  │     ■■■■■■■■■■■■■■■       │
/// │           ■■■             │  │     ■■■■■■■■■■■■■■■       │
/// │     auto (natural size)   │  │     contain (fit within)  │
/// │                           │  │                           │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■■■■■■■■■■■■■■■■■■■■■■■■■ │  │     ■■■■■■■■■             │
/// │ ■■■■■■■■■■■■■■■■■■■■■■■■■ │  │     ■■■■■■■■■             │
/// │ ■■■■■■■■■■■■■■■■■■■■■■■■■ │  │     100px 150px           │
/// │ cover (fill completely)   │  │                           │
/// │ ■■■■■■■■■■■■■■■■■■■■■■■■■ │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Use the image's natural size (default)
/// .maskSize(.auto)
///
/// // Scale the image to fit within the container
/// .maskSize(.contain)
///
/// // Scale the image to cover the entire container
/// .maskSize(.cover)
///
/// // Set a specific width (height auto-scales to maintain aspect ratio)
/// .maskSize(.width(.percentage(50)))
///
/// // Set specific width and height
/// .maskSize(.size(.px(100), .px(150)))
///
/// // Different sizes for multiple masks
/// .maskSize([.contain, .cover])
/// ```
///
/// - Note: When using percentage values, they are relative to the mask positioning area
///         determined by the `mask-origin` property.
///
/// - SeeAlso: [MDN Web Docs on mask-size](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-size)
public enum MaskSize: Property {
    public static let property: String = "mask-size"

    /// Scale to the container without cropping or stretching (fit inside)
    case contain

    /// Scale to fill the container completely (may crop)
    case cover

    /// Use natural size or scale proportionally
    case auto

    /// Specify just width (height auto-scales to maintain aspect ratio)
    case width(LengthPercentage)

    /// Specify both width and height
    case size(LengthPercentage, LengthPercentage)

    /// Multiple sizes for multiple masks
    case multiple([MaskSize])

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension MaskSize: CustomStringConvertible {
    /// Converts the mask-size value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-size: auto;
    /// mask-size: contain;
    /// mask-size: cover;
    /// mask-size: 50%;
    /// mask-size: 100px 150px;
    /// mask-size: contain, cover;
    /// ```
    public var description: String {
        switch self {
        case .contain:
            return "contain"
        case .cover:
            return "cover"
        case .auto:
            return "auto"
        case .width(let width):
            return width.description
        case .size(let width, let height):
            return "\(width) \(height)"
        case .multiple(let sizes):
            return sizes.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

extension MaskSize: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> MaskSize {
        switch value {
        case .length(let length):
            return .width(.length(length))
        case .percentage(let percentage):
            return .width(.percentage(percentage))
        default: fatalError()
        }
    }
}

/// Default value and convenience methods
extension MaskSize {
    /// The default value for mask-size (`auto`)
    public static let `default` = MaskSize.auto

    /// Auto size for width and height
    public static let autoSize = MaskSize.size(.auto, .auto)

    /// Creates a mask size with multiple values
    ///
    /// - Parameter sizes: The size values for each mask
    /// - Returns: A mask size with multiple values
    public static func values(_ sizes: [MaskSize]) -> MaskSize {
        if sizes.count == 1, case let size = sizes[0] {
            return size
        }
        return .multiple(sizes)
    }

    /// Creates a mask size with multiple values
    ///
    /// - Parameter sizes: The size values for each mask
    /// - Returns: A mask size with multiple values
    public static func values(_ sizes: MaskSize...) -> MaskSize {
        values(sizes)
    }
}
