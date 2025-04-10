//
//  ImageResolution.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `image-resolution` property specifies the intrinsic resolution of all raster images
/// used in or on the element.
///
/// It affects content images such as replaced elements and generated content, and decorative
/// images such as background-image images. The image resolution is defined as the number of
/// image pixels per unit length, e.g., pixels per inch.
///
/// - Warning: This is an experimental property and is not well-supported in browsers yet.
///
/// - SeeAlso: [MDN Web Docs on image-resolution](https://developer.mozilla.org/en-US/docs/Web/CSS/image-resolution)
public enum ImageResolution: Property {
    
    public static let property: String = "image-resolution"
    
    /// Uses the intrinsic resolution as specified by the image format
    case fromImage(snap: Bool = false)
    
    /// Specifies the intrinsic resolution explicitly
    case resolution(Resolution, snap: Bool = false)
    
    /// Combines from-image with a fallback resolution
    case fromImageWithFallback(Resolution, snap: Bool = false)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a new image resolution
    /// - Parameters:
    ///   - source: The resolution source
    ///   - snap: Whether to snap the resolution to device pixels
    public init(source: Source, snap: Bool = false) {
        switch source {
        case .fromImage:
            self = .fromImage(snap: snap)
        case .resolution(let resolution):
            self = .resolution(resolution, snap: snap)
        case .fromImageWithFallback(let resolution):
            self = .fromImageWithFallback(resolution, snap: snap)
        }
    }
    
    /// The source type for image resolution
    public enum Source: Sendable, Equatable {
        /// Uses the intrinsic resolution as specified by the image format
        case fromImage
        
        /// Specifies the intrinsic resolution explicitly
        case resolution(Resolution)
        
        /// Combines from-image with a fallback resolution
        case fromImageWithFallback(Resolution)
    }
    
    /// Applies the snap keyword to snap the resolution to device pixels
    public func snapped() -> ImageResolution {
        switch self {
        case .fromImage:
            return .fromImage(snap: true)
        case .resolution(let resolution, _):
            return .resolution(resolution, snap: true)
        case .fromImageWithFallback(let resolution, _):
            return .fromImageWithFallback(resolution, snap: true)
        case .global:
            return self
        }
    }
}

/// Provides string conversion for CSS output
extension ImageResolution: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fromImage(let snap):
            return snap ? "from-image snap" : "from-image"
            
        case .resolution(let resolution, let snap):
            return snap ? "\(resolution.description) snap" : resolution.description
            
        case .fromImageWithFallback(let resolution, let snap):
            return snap ? "from-image \(resolution.description) snap" : "from-image \(resolution.description)"
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common image resolution values
extension ImageResolution {
    /// Uses the intrinsic resolution as specified by the image format.
    public static var fromImage: ImageResolution {
        .fromImage()
    }
    
       /// Specifies the resolution in dpi.
    public static func dpi(_ value: Double) -> ImageResolution {
        .resolution(.dpi(value))
    }
}
