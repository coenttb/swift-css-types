//
//  Stroke.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `stroke` property defines the color or SVG paint server used to draw an element's stroke outline.
///
/// This property applies to SVG elements that can have a stroke, such as shapes and text elements.
/// It specifies the paint (color, gradient, or pattern) to use for drawing the outline of these elements.
///
/// Although the CSS specification defines `stroke` as a shorthand for various stroke properties
/// (stroke-width, stroke-dasharray, etc.), browsers currently implement it as a direct analog
/// to the SVG stroke attribute, affecting only the stroke color or paint server.
///
/// Example:
/// ```swift
/// .stroke(.none)                        // stroke: none
/// .stroke(.color(.red))                 // stroke: red
/// .stroke(.color(.hex("#3366cc")))      // stroke: #3366cc
/// .stroke(.color(.namedColor(.coral)))  // stroke: coral
/// .stroke(.url(Url("myGradient")))      // stroke: url(#myGradient)
/// ```
///
/// - Note: CSS gradients cannot be used with the stroke property; only SVG gradients and patterns
///         referenced by URL are valid when using gradient/pattern values.
///
/// - SeeAlso: [MDN Web Docs on stroke](https://developer.mozilla.org/en-US/docs/Web/CSS/stroke)
public indirect enum Stroke: Property, ColorConvertible {
  public static let property: String = "stroke"

  /// No stroke is painted (transparent)
  case none

  /// Uses the stroke value from a context element
  case contextStroke

  /// A specific color for the stroke
  case color(CSSTypeTypes.Color)

  /// A URL reference to an SVG paint server element (gradient, pattern)
  case url(Url)

  /// A URL with a fallback color if the URL reference doesn't resolve
  case urlWithFallback(url: Url, fallback: Stroke = .none)

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .contextStroke:
      return "context-stroke"
    case .color(let color):
      return color.description
    case .url(let url):
      return url.description
    case .urlWithFallback(let url, let fallback):
      return "\(url) \(fallback)"
    case .global(let value):
      return value.description
    }
  }
}
