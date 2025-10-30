import Foundation

/// Represents a CSS image value.
///
/// The `Image` type represents a two-dimensional image in CSS. It can be defined by:
/// - A URL pointing to an image file
/// - A CSS gradient
/// - A part of the webpage (element function)
/// - An image fragment or solid color (image function)
/// - A blending of images (cross-fade function)
/// - A resolution-dependent image selection (image-set function)
/// - A paint worklet (paint function)
///
/// Example:
/// ```swift
/// .backgroundImage(.url("banner.jpg"))               // url(banner.jpg)
/// .backgroundImage(.linearGradient([.red, .blue]))   // linear-gradient(red, blue)
/// ```
///
/// - SeeAlso: [MDN Web Docs on image](https://developer.mozilla.org/en-US/docs/Web/CSS/image)
public indirect enum Image: Sendable, Hashable {

  /// Represents an image from a URL
  case url(Url)

  /// Represents a CSS gradient (linear-gradient, radial-gradient, etc.)
  /// Note: This is a placeholder for a more comprehensive gradient implementation
  case gradient(Gradient)

  /// Represents the element() function to capture a part of the webpage
  case element(id: String)

  /// Represents a cross-fade between two or more images
  case crossFade(percentage: Percentage, from: Image, to: Image)

  /// Represents an image-set for resolution-dependent image selection
  case imageSet(images: [ImageSetItem])

  /// Represents a paint() function for using CSS Paint API
  case paint(name: String, arguments: [String] = [])

  /// Represents a none value
  case none
}

/// Provides string conversion for CSS output
extension Image: CustomStringConvertible {
  /// Converts the image to its CSS string representation
  public var description: String {
    switch self {
    case .url(let url):
      return url.description
    case .gradient(let gradientString):
      return gradientString.description
    case .element(let id):
      return "element(#\(id))"
    case .crossFade(let percentage, let from, let to):
      let formattedPercentage = percentage.value.truncatingRemainder(digits: 5)
      return "cross-fade(\(formattedPercentage)% \(from), \(to))"
    case .imageSet(let images):
      let imageParts = images.map { "\'\($0.url)\' \($0.resolution)" }
      return "image-set(\(imageParts.joined(separator: ", ")))"
    case .paint(let name, let arguments):
      if arguments.isEmpty {
        return "paint(\(name))"
      } else {
        return "paint(\(name), \(arguments.joined(separator: ", ")))"
      }
    case .none:
      return "none"
    }
  }
}

/// Factory methods for creating image values
extension Image {
  /// Creates a linear gradient image
  public static func linearGradient(_ stops: [Color]) -> Self {
    return .gradient(
      Gradient.linear(direction: nil, colorStops: stops.map { Gradient.ColorStop($0) })
    )
  }

  /// Creates a linear gradient image with an angle
  public static func linearGradient(angle: Angle, stops: [Color]) -> Self {
    return .gradient(
      Gradient.linear(
        direction: .angle(angle),
        colorStops: stops.map { Gradient.ColorStop($0) }
      )
    )
  }

  /// Creates a linear gradient image with a direction to a side or corner
  public static func linearGradient(to side: Gradient.Direction.Side, stops: [Color]) -> Self {
    return .gradient(
      Gradient.linear(
        direction: .to(side),
        colorStops: stops.map { Gradient.ColorStop($0) }
      )
    )
  }

  /// Creates a radial gradient image
  public static func radialGradient(_ stops: [Color]) -> Self {
    return .gradient(
      Gradient.radial(
        options: nil,
        colorStops: stops.map { Gradient.ColorStop($0) }
      )
    )
  }

  /// Creates a conic gradient image
  public static func conicGradient(from angle: Angle, stops: [Color]) -> Self {
    return .gradient(
      Gradient.conic(
        angle: angle,
        at: nil,
        colorStops: stops.map { Gradient.ColorStop($0) }
      )
    )
  }

  /// Creates a paint() function value
  public static func paint(_ name: String, arguments: [String] = []) -> Self {
    return .paint(name: name, arguments: arguments)
  }

  /// Creates an image-set from an array of URLs and resolutions
  public static func imageSet(_ items: [(url: String, resolution: String)]) -> Self {
    let imageItems = items.map { ImageSetItem(url: $0.url, resolution: $0.resolution) }
    return .imageSet(images: imageItems)
  }
}

/// A tuple representing an image source with its resolution
public struct ImageSetItem: Sendable, Hashable {
  public let url: String
  public let resolution: String

  public init(url: String, resolution: String) {
    self.url = url
    self.resolution = resolution
  }
}
