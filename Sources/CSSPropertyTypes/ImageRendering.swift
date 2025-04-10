//
//  ImageRendering.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `image-rendering` property sets an image scaling algorithm.
///
/// The property applies to an element itself, to any images set in its other properties,
/// and to its descendants. This property controls how the browser scales images when
/// their display size doesn't match their natural size.
///
/// - SeeAlso: [MDN Web Docs on image-rendering](https://developer.mozilla.org/en-US/docs/Web/CSS/image-rendering)
public enum ImageRendering: Property {
    
    public static let property: String = "image-rendering"
    
    /// The scaling algorithm is browser dependent. Most browsers use
    /// bilinear resampling (high quality).
    case auto
    
    /// The image should be scaled with an algorithm that maximizes the appearance
    /// of the image, such as bilinear interpolation. This is intended for images
    /// such as photos.
    case smooth
    
    /// The image is scaled with an algorithm such as "nearest neighbor"
    /// that preserves contrast and edges in the image. No blurring or color
    /// smoothing occurs. This is intended for images such as pixel art or line drawings.
    case crispEdges
    
    /// The image is scaled with the "nearest neighbor" or similar algorithm.
    /// This is intended to preserve a "pixelated" look.
    case pixelated
    
    /// A preference for higher-quality scaling.
    /// Note: This is defined in the spec but not supported in most browsers.
    case highQuality
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .smooth:
            return "smooth"
        case .crispEdges:
            return "crisp-edges"
        case .pixelated:
            return "pixelated"
        case .highQuality:
            return "high-quality"
        case .global(let global):
            return global.description
        }
    }
}
