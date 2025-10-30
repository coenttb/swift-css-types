import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-image` property, which sets one or more images to be used as mask layers for an element.
///
/// This property defines the image that will be used as a mask for an element. By default, the alpha channel of
/// the mask image will be multiplied with the alpha channel of the element, but this can be controlled with
/// the `mask-mode` property.
///
/// Visual Reference:
/// ```
/// Original Content:               Mask Applied:
/// ┌───────────────────────┐       ┌───────────────────────┐
/// │                       │       │       ▲               │
/// │                       │       │      ▲ ▲              │
/// │      Content to       │  +    │     ▲   ▲             │
/// │        mask           │       │    ▲     ▲            │
/// │                       │       │   ▲▲▲▲▲▲▲▲▲           │
/// │                       │       │                       │
/// └───────────────────────┘       └───────────────────────┘
///                             =
/// ┌───────────────────────┐
/// │                       │
/// │         ▲             │
/// │        ▲ ▲            │
/// │       ▲   ▲           │
/// │      ▲     ▲          │
/// │     ▲▲▲▲▲▲▲▲▲         │
/// └───────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // No mask image
/// .maskImage(.none)
///
/// // Use an SVG as a mask
/// .maskImage(.url("mask.svg#element"))
///
/// // Use a gradient as a mask
/// .maskImage(.gradientString("linear-gradient(to right, black, transparent)"))
///
/// // Multiple mask images (layered)
/// .maskImage([
///     .url("mask1.svg"),
///     .gradientString("radial-gradient(circle at center, transparent 50%, black 100%)")
/// ])
/// ```
///
/// - Note: For security reasons, when using URL-based mask images, only images served over HTTP and
///         HTTPS are accepted due to CORS policy. Images that fail to load will be treated as
///         transparent black.
///
/// - SeeAlso: [MDN Web Docs on mask-image](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-image)
public enum MaskImage: Property {
  public static let property: String = "mask-image"
  /// No mask image (transparent black)
  case none

  /// A single image as mask
  case single(Image)

  /// Multiple images as mask layers
  case multiple([Image])

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a mask image with a single image
  ///
  /// - Parameter image: The image to use as mask
  public init(_ image: Image) {
    self = .single(image)
  }

  /// Creates a mask image with multiple images as layers
  ///
  /// - Parameter images: The images to use as mask layers (first will be on top)
  public init(_ images: [Image]) {
    if images.count == 1 {
      self = .single(images[0])
    } else {
      self = .multiple(images)
    }
  }
}

/// Provides string conversion for CSS output
extension MaskImage: CustomStringConvertible {
  /// Converts the mask-image value to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// mask-image: none;
  /// mask-image: url("mask.svg#element");
  /// mask-image: linear-gradient(to right, black, transparent);
  /// mask-image: url("mask1.svg"), radial-gradient(circle at center, transparent 50%, black 100%);
  /// ```
  public var description: String {
    switch self {
    case .none:
      return "none"
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
extension MaskImage {
  /// The default value for mask-image (`none`)
  public static let `default` = MaskImage.none

  /// Creates a mask image with a URL reference
  ///
  /// - Parameter url: The URL of the mask image
  /// - Returns: A mask image with the URL reference
  public static func url(_ url: Url) -> MaskImage {
    MaskImage.single(.url(url))
  }

  /// Creates a mask image with a gradient string
  ///
  /// - Parameter gradientString: The complete gradient string
  /// - Returns: A mask image with the gradient
  public static func gradientString(_ gradient: Gradient) -> MaskImage {
    MaskImage(.gradient(gradient))
  }

  /// Creates a mask image with a linear gradient
  ///
  /// - Parameter stops: The color stops for the gradient
  /// - Returns: A mask image with the linear gradient
  public static func linearGradient(_ stops: [CSSTypeTypes.Color]) -> MaskImage {
    MaskImage(.linearGradient(stops))
  }

  /// Creates a mask image with a directional linear gradient
  ///
  /// - Parameters:
  ///   - direction: The direction of the gradient
  ///   - stops: The color stops for the gradient
  /// - Returns: A mask image with the linear gradient
  public static func linearGradient(
    to side: Gradient.Direction.Side,
    stops: [CSSTypeTypes.Color]
  ) -> MaskImage {
    //        MaskImage(.linearGradient(direction: direction, stops: stops))
    MaskImage.single(.linearGradient(to: side, stops: stops))
  }

  /// Creates a mask image with a radial gradient
  ///
  /// - Parameter stops: The color stops for the gradient
  /// - Returns: A mask image with the radial gradient
  public static func radialGradient(_ stops: [CSSTypeTypes.Color]) -> MaskImage {
    MaskImage(.radialGradient(stops))
  }

  /// Creates a mask image with a conic gradient
  ///
  /// - Parameters:
  ///   - angle: The starting angle of the gradient
  ///   - stops: The color stops for the gradient
  /// - Returns: A mask image with the conic gradient
  public static func conicGradient(from angle: Angle, stops: [CSSTypeTypes.Color]) -> MaskImage {
    MaskImage(.conicGradient(from: angle, stops: stops))
  }

  /// Creates a mask image with multiple values
  ///
  /// - Parameter images: The images to use as mask layers
  /// - Returns: A mask image with multiple values
  public static func values(_ images: [Image]) -> MaskImage {
    MaskImage(images)
  }

  /// Creates a mask image with multiple values
  ///
  /// - Parameter images: The images to use as mask layers
  /// - Returns: A mask image with multiple values
  public static func values(_ images: Image...) -> MaskImage {
    values(images)
  }
}
