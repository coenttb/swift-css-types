import Foundation
import CSSTypeTypes

/// Represents the CSS `background` shorthand property, which sets all background style properties at once.
///
/// The background property is a shorthand for setting multiple background-related properties:
/// - background-attachment
/// - background-clip
/// - background-color
/// - background-image
/// - background-origin
/// - background-position
/// - background-repeat
/// - background-size
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     Background with       │  │     Background with       │
/// │     solid color           │  │     image                 │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │     Background with       │  │     Background with       │
/// │     gradient              │  │     multiple images       │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Simple solid color background
/// .background(.color(.red))
///
/// // Background image with specific settings
/// .background(.image(.url("image.jpg"), position: .center, size: .cover, repeat: .noRepeat))
///
/// // Multiple backgrounds with different layers
/// .background(.layers([
///     .image(.url("pattern.png"), repeat: .repeat),
///     .color(.rgba(255, 255, 255, 0.5))
/// ]))
///
/// // Use a global value
/// .background(.global(.inherit))
/// ```
///
/// - SeeAlso: [MDN Web Docs on background](https://developer.mozilla.org/en-US/docs/Web/CSS/background)
public enum Background: Property, ColorConvertible {
    public static let property: String = "background"
    
    /// No background
    case none
    
    /// A single background layer
    case layer(Layer)
    
    /// Multiple background layers
    case layers([Layer])
    
    /// Just a background color
    case color(CSSTypeTypes.Color)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}


extension Background {
    /// A single background layer configuration
    public struct Layer: Sendable, Equatable {
        /// The background image to display
        public var image: Image?
        
        /// The position of the background image
        public var position: BackgroundPosition?
        
        /// The size of the background image
        public var size: BackgroundSize?
        
        /// How the background image repeats
        public var `repeat`: BackgroundRepeat?
        
        /// How the background image is attached to the viewport
        public var attachment: BackgroundAttachment?
        
        /// How the background image's positioning area is defined
        public var origin: BackgroundOrigin?
        
        /// How the background image is clipped
        public var clip: BackgroundClip?
        
        /// The background color (only valid for the last/bottom layer)
        public var color: Color?
        
        /// Creates a new background layer with specified properties
        ///
        /// - Parameters:
        ///   - image: The background image
        ///   - position: The position of the background image
        ///   - size: The size of the background image
        ///   - repeat: How the background image repeats
        ///   - attachment: How the background image is attached to the viewport
        ///   - origin: How the background image's positioning area is defined
        ///   - clip: How the background image is clipped
        ///   - color: The background color (only valid for the last/bottom layer)
        public init(
            image: Image? = nil,
            position: BackgroundPosition? = nil,
            size: BackgroundSize? = nil,
            repeat: BackgroundRepeat? = nil,
            attachment: BackgroundAttachment? = nil,
            origin: BackgroundOrigin? = nil,
            clip: BackgroundClip? = nil,
            color: Color? = nil
        ) {
            self.image = image
            self.position = position
            self.size = size
            self.repeat = `repeat`
            self.attachment = attachment
            self.origin = origin
            self.clip = clip
            self.color = color
        }
        
        /// Creates a background layer with just a color
        ///
        /// - Parameter color: The background color
        /// - Returns: A background layer with only a color
        public static func color(_ color: Color) -> Layer {
            Layer(color: color)
        }
        
        /// Creates a background layer with an image and optional settings
        ///
        /// - Parameters:
        ///   - image: The background image
        ///   - position: The position of the background image
        ///   - size: The size of the background image
        ///   - repeat: How the background image repeats
        ///   - attachment: How the background image is attached to the viewport
        ///   - origin: How the background image's positioning area is defined
        ///   - clip: How the background image is clipped
        /// - Returns: A background layer with an image and specified settings
        public static func image(
            _ image: Image,
            position: BackgroundPosition? = nil,
            size: BackgroundSize? = nil,
            repeat: BackgroundRepeat? = nil,
            attachment: BackgroundAttachment? = nil,
            origin: BackgroundOrigin? = nil,
            clip: BackgroundClip? = nil
        ) -> Layer {
            Layer(
                image: image,
                position: position,
                size: size,
                repeat: `repeat`,
                attachment: attachment,
                origin: origin,
                clip: clip
            )
        }
//
//        /// Creates a gradient background layer
//        ///
//        /// - Parameters:
//        ///   - gradient: The gradient to use as background
//        ///   - position: The position of the gradient
//        ///   - size: The size of the gradient
//        ///   - repeat: How the gradient repeats
//        ///   - attachment: How the gradient is attached to the viewport
//        ///   - origin: How the gradient's positioning area is defined
//        ///   - clip: How the gradient is clipped
//        /// - Returns: A background layer with a gradient and specified settings
//        public static func gradient(
//            _ gradient: Gradient,
//            position: BackgroundPosition? = nil,
//            size: BackgroundSize? = nil,
//            repeat: BackgroundRepeat? = nil,
//            attachment: BackgroundAttachment? = nil,
//            origin: BackgroundOrigin? = nil,
//            clip: BackgroundClip? = nil
//        ) -> Layer {
//            Layer(
//                image: .gradient(gradient),
//                position: position,
//                size: size,
//                repeat: `repeat`,
//                attachment: attachment,
//                origin: origin,
//                clip: clip
//            )
//        }
//
//        /// Creates a linear gradient background
//        ///
//        /// - Parameters:
//        ///   - direction: The direction of the gradient
//        ///   - stops: The color stops for the gradient
//        /// - Returns: A background layer with a linear gradient
//        public static func linear(
//            _ direction: Gradient.LinearGradient.Direction,
//            _ stops: [Gradient.LinearGradient.ColorStop]
//        ) -> Layer {
//            let gradient = Gradient.LinearGradient(direction: direction, stops: stops)
//            return .gradient(.linear(gradient))
//        }
//
//        /// Creates a radial gradient background
//        ///
//        /// - Parameters:
//        ///   - position: The position of the gradient center
//        ///   - stops: The color stops for the gradient
//        /// - Returns: A background layer with a radial gradient
//        public static func radial(
//            position: Gradient.RadialGradient.Position? = nil,
//            shape: Gradient.RadialGradient.Shape? = nil,
//            size: Gradient.RadialGradient.Size? = nil,
//            stops: [Gradient.LinearGradient.ColorStop]
//        ) -> Layer {
//            let gradient = Gradient.RadialGradient(position: position, shape: shape, size: size, stops: stops)
//            return .gradient(.radial(gradient))
//        }
    }
}

/// Provides string conversion for CSS output
extension Background: CustomStringConvertible {
    /// Converts the background to its CSS string representation
    ///
    /// This method combines multiple background layers with commas between them:
    /// ```css
    /// background: url("image.jpg") center/cover no-repeat, linear-gradient(to bottom, blue, purple);
    /// background: none;
    /// background: inherit;
    /// ```
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .layer(let layer):
            return layer.description
        case .layers(let layers):
            if layers.isEmpty {
                return "none"
            }
            return layers.map { $0.description }.joined(separator: ", ")
        case .color(let color):
            return color.description
        case .global(let global):
            return global.description
        }
    }
}

/// Provides string conversion for background layers
extension Background.Layer: CustomStringConvertible {
    /// Converts a background layer to its CSS string representation
    ///
    /// This method combines the various components of a background layer:
    /// ```css
    /// url("image.jpg") center/cover no-repeat fixed content-box padding-box
    /// ```
    public var description: String {
        var components: [String] = []
        
        // Add image
        if let image = image {
            components.append(image.description)
        }
        
        // Add position and size (position/size)
        if let position = position {
            var positionStr = position.description
            if let size = size {
                positionStr += "/\(size.description)"
            }
            components.append(positionStr)
        } else if let size = size {
            // If we have a size but no position, use the default position
            components.append("0% 0%/\(size.description)")
        }
        
        // Add repeat style
        if let repeatStyle = self.repeat {
            components.append(repeatStyle.description)
        }
        
        // Add attachment
        if let attachment = attachment {
            components.append(attachment.description)
        }
        
        // Origin and clip can appear in either order
        // According to the MDN docs, the first is origin, the second is clip
        if let origin = origin {
            components.append(origin.description)
        }
        
        if let clip = clip {
            components.append(clip.description)
        }
        
        // Add color (should only be in the last layer according to spec)
        if let color = color {
            components.append(color.description)
        }
        
        // Special case: empty or just color
        if components.isEmpty {
            return "none"
        }
        
        return components.joined(separator: " ")
    }
}

/// Convenience initializers for common background patterns
extension Background {
    /// Creates a background with a single image
    ///
    /// - Parameters:
    ///   - url: The URL of the image
    ///   - position: The position of the image
    ///   - size: The size of the image
    ///   - repeat: How the image repeats
    /// - Returns: A background with a single image
    public static func image(
        _ url: String,
        position: BackgroundPosition? = nil,
        size: BackgroundSize? = nil,
        repeat: BackgroundRepeat? = nil
    ) -> Background {
        .layer(Layer.image(.url(.init(url)), position: position, size: size, repeat: `repeat`))
    }
    
//    /// Creates a linear gradient background
//    ///
//    /// - Parameters:
//    ///   - direction: The direction of the gradient
//    ///   - stops: The color stops for the gradient
//    /// - Returns: A background with a linear gradient
//    public static func linearGradient(
//        _ direction: Gradient.LinearGradient.Direction,
//        _ stops: [Gradient.LinearGradient.ColorStop]
//    ) -> Background {
//        .layer(Layer.linear(direction, stops))
//    }
    
    /// Creates a transparent background
    ///
    /// This is equivalent to `background: transparent;`
    public static let transparent = Background.color(.transparent)
    
    /// Inherits the value from the parent element
    public static let inherit = Background.global(.inherit)
    
    /// Uses the default value for the property
    public static let initial = Background.global(.initial)
    
    /// Reverts to the browser's default styling
    public static let revert = Background.global(.revert)
    
    /// Reverts to the value established in the previous cascade layer
    public static let revertLayer = Background.global(.revertLayer)
    
    /// Resets to its natural value (acts like `inherit` or `initial` depending on the property)
    public static let unset = Background.global(.unset)
}
