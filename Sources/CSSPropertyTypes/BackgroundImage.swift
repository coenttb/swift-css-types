import Foundation
import CSSTypeTypes

/// Represents the CSS `background-image` property, which sets one or more background images on an element.
///
/// This property allows you to set one or more images as the background of an element.
/// Multiple images can be specified, with the first image being visually closest to the user.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │    Element with           │  │    Element with           │
/// │    image background       │  │    gradient background    │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │    Element with           │  │    Element with           │
/// │    multiple layered       │  │    no background          │
/// │    images                 │  │    image (none)           │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Single image
/// .backgroundImage(.url("image.jpg"))
///
/// // Linear gradient
/// .backgroundImage(.linearGradient(stops: [.red, .blue]))
///
/// // Directional gradient
/// .backgroundImage(.linearGradient(direction: "to bottom", stops: [.blue, .white]))
///
/// // Multiple background images (layers)
/// .backgroundImage([
///     .url("top-image.png"),
///     .url("bottom-image.png")
/// ])
///
/// // No background image
/// .backgroundImage(.none)
/// ```
///
/// - Note: When working with multiple backgrounds, they are layered with the first specified being
///         the closest to the user. If an image cannot be displayed, it is treated as if `none` was specified.
///
/// - SeeAlso: [MDN Web Docs on background-image](https://developer.mozilla.org/en-US/docs/Web/CSS/background-image)
public enum BackgroundImage: Property {
    public static let property: String = "background-image"
    
    /// A single image
    case single(Image)
    
    /// Multiple images as layers
    case multiple([Image])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a background image with a single image
    ///
    /// - Parameter image: The image to use
    public init(_ image: Image) {
        self = .single(image)
    }
    
    /// Creates a background image with multiple images as layers
    ///
    /// - Parameter images: The images to use as layers (first will be on top)
    public init(_ images: [Image]) {
        if images.count == 1 {
            self = .single(images[0])
        } else {
            self = .multiple(images)
        }
    }
}

/// Provides string conversion for CSS output
extension BackgroundImage: CustomStringConvertible {
    /// Converts the background-image value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-image: url("image.jpg");
    /// background-image: linear-gradient(red, blue);
    /// background-image: url("top.png"), url("bottom.png");
    /// background-image: none;
    /// ```
    public var description: String {
        switch self {
        case .single(let image):
            return image.description
        case .multiple(let images):
            return images.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundImage {
    /// The default value for background-image (`none`)
    public static let `default` = BackgroundImage(.none)
    
    /// No background image
    public static let none = BackgroundImage(.none)
    
    /// Creates a background image with a URL
    ///
    /// - Parameter url: The URL of the image
    /// - Returns: A background image with a URL
    public static func url(_ url: Url) -> BackgroundImage {
        BackgroundImage.single(.url(url))
    }
    
    /// Creates a background image with a linear gradient
    ///
    /// - Parameter stops: The color stops for the gradient
    /// - Returns: A background image with a linear gradient
    public static func linearGradient(stops: [CSSTypeTypes.Color]) -> BackgroundImage {
        BackgroundImage(.linearGradient(stops))
    }
    
    /// Creates a background image with a directional linear gradient
    ///
    /// - Parameters:
    ///   - direction: The direction of the gradient (e.g., "to bottom", "to right")
    ///   - stops: The color stops for the gradient
    /// - Returns: A background image with a directional linear gradient
    public static func linearGradient(to side: Gradient.Direction.Side, stops: [CSSTypeTypes.Color]) -> BackgroundImage {
        BackgroundImage(.linearGradient(to: side, stops: stops))
    }
    
    /// Creates a background image with a radial gradient
    ///
    /// - Parameter stops: The color stops for the gradient
    /// - Returns: A background image with a radial gradient
    public static func radialGradient(stops: [CSSTypeTypes.Color]) -> BackgroundImage {
        BackgroundImage(.radialGradient(stops))
    }
    
    /// Creates a background image with a conic gradient
    ///
    /// - Parameters:
    ///   - angle: The starting angle for the gradient
    ///   - stops: The color stops for the gradient
    /// - Returns: A background image with a conic gradient
    public static func conicGradient(from angle: Angle, stops: [CSSTypeTypes.Color]) -> BackgroundImage {
        BackgroundImage(.conicGradient(from: angle, stops: stops))
    }
    
    /// Creates a background image with multiple values
    ///
    /// - Parameter images: The images to use as layers
    /// - Returns: A background image with multiple values
    public static func values(_ images: [Image]) -> BackgroundImage {
        BackgroundImage(images)
    }
    
    /// Creates a background image with multiple values
    ///
    /// - Parameter images: The images to use as layers
    /// - Returns: A background image with multiple values
    public static func values(_ images: Image...) -> BackgroundImage {
        values(images)
    }
}
