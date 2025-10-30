//
//  WebkitMaskPositionY.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-webkit-mask-position-y` property sets the initial vertical position of a mask image.
///
/// This property allows specifying the vertical position of a mask image independently
/// from the horizontal position, which is controlled by `-webkit-mask-position-x`.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■                         │  │                           │
/// │                           │  │             ■             │
/// │                           │  │                           │
/// │      top (0%)             │  │      center (50%)         │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      bottom (100%)        │  │      75px                 │
/// │ ■                         │  │                      ■    │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position at the top edge (default)
/// .webkitMaskPositionY(.top)
///
/// // Position at the vertical center
/// .webkitMaskPositionY(.center)
///
/// // Position at the bottom edge
/// .webkitMaskPositionY(.bottom)
///
/// // Position at a specific percentage
/// .webkitMaskPositionY(.value(.percentage(25)))
///
/// // Position at a specific pixel value
/// .webkitMaskPositionY(.value(.px(50)))
///
/// // Multiple positions for multiple masks
/// .webkitMaskPositionY(.multiple([.top, .bottom]))
/// ```
///
/// - Note: This is a non-standard property. Consider using the standard `mask-position` property
///         for production sites when possible.
///
/// - SeeAlso: [MDN Web Docs on -webkit-mask-position-y](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-mask-position-y)
public enum WebkitMaskPositionY: Property, LengthPercentageConvertible {
  public static let property: String = "-webkit-mask-position-y"

  /// Top edge position (0%)
  case top

  /// Vertical center position (50%)
  case center

  /// Bottom edge position (100%)
  case bottom

  /// A position defined by a length or percentage value
  case lengthPercentage(LengthPercentage)

  /// Multiple vertical positions for multiple masks
  case multiple([WebkitMaskPositionY])

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a mask position-y with multiple values
  ///
  /// - Parameter positions: The position values
  /// - Returns: A mask position-y with multiple values
  public init(_ positions: [WebkitMaskPositionY]) {
    if positions.count == 1 {
      self = positions[0]
    } else {
      self = .multiple(positions)
    }
  }
}

/// String conversion for WebkitMaskPositionY
extension WebkitMaskPositionY: CustomStringConvertible {
  /// Converts the -webkit-mask-position-y value to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// -webkit-mask-position-y: top;
  /// -webkit-mask-position-y: center;
  /// -webkit-mask-position-y: bottom;
  /// -webkit-mask-position-y: 25%;
  /// -webkit-mask-position-y: 100px;
  /// -webkit-mask-position-y: top, bottom;
  /// ```
  public var description: String {
    switch self {
    case .top:
      return "top"
    case .center:
      return "center"
    case .bottom:
      return "bottom"
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description
    case .multiple(let positions):
      return positions.map { $0.description }.joined(separator: ", ")
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for WebkitMaskPositionY
extension WebkitMaskPositionY {

  /// Creates a position with multiple values
  ///
  /// - Parameter positions: The position values
  /// - Returns: A vertical position with multiple values
  public static func values(_ positions: [WebkitMaskPositionY]) -> WebkitMaskPositionY {
    WebkitMaskPositionY(positions)
  }

  /// Creates a position with multiple values
  ///
  /// - Parameter positions: The position values
  /// - Returns: A vertical position with multiple values
  public static func values(_ positions: WebkitMaskPositionY...) -> WebkitMaskPositionY {
    values(positions)
  }
}
