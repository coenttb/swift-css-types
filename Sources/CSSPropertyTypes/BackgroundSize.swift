import Foundation
import CSSTypeTypes

/// Represents the CSS `background-size` property, which sets the size of background images.
///
/// This property controls how background images are sized within their containing area.
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
/// .backgroundSize(.auto)
///
/// // Scale the image to fit within the container
/// .backgroundSize(.contain)
///
/// // Scale the image to cover the entire container
/// .backgroundSize(.cover)
///
/// // Set a specific width (height auto-scales to maintain aspect ratio)
/// .backgroundSize(.width(.percentage(50)))
///
/// // Set specific width and height
/// .backgroundSize(.size(.px(100), .px(150)))
///
/// // Different sizes for multiple backgrounds
/// .backgroundSize([.contain, .cover])
/// ```
///
/// - Note: When using percentage values, they are relative to the background positioning area
///         determined by the `background-origin` property.
///
/// - SeeAlso: [MDN Web Docs on background-size](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size)
public enum BackgroundSize: Property {
    public static let property: String = "background-size"
    
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
    
    /// Multiple sizes for multiple backgrounds
    case multiple([BackgroundSize])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BackgroundSize: CustomStringConvertible {
    /// Converts the background-size value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-size: auto;
    /// background-size: contain;
    /// background-size: cover;
    /// background-size: 50%;
    /// background-size: 100px 150px;
    /// background-size: contain, cover;
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
extension BackgroundSize: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> BackgroundSize {
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
extension BackgroundSize {
    /// The default value for background-size (`auto`)
    public static let `default` = BackgroundSize.auto
    
    /// Auto size for width and height
    public static let autoSize = BackgroundSize.size(.auto, .auto)
    
    /// Creates a background size with multiple values
    ///
    /// - Parameter sizes: The size values for each background
    /// - Returns: A background size with multiple values
    public static func values(_ sizes: [BackgroundSize]) -> BackgroundSize {
        if sizes.count == 1, case let size = sizes[0] {
            return size
        }
        return .multiple(sizes)
    }
    
    /// Creates a background size with multiple values
    ///
    /// - Parameter sizes: The size values for each background
    /// - Returns: A background size with multiple values
    public static func values(_ sizes: BackgroundSize...) -> BackgroundSize {
        values(sizes)
    }
}
