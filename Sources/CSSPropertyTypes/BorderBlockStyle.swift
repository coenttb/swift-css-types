//
//  BorderBlockStyle.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `border-block-style` property defines the style of the logical block borders of an element.
///
/// This property maps to physical border styles depending on the element's writing mode, directionality,
/// and text orientation. It corresponds to the border-top-style and border-bottom-style, or border-left-style
/// and border-right-style properties depending on writing-mode, direction, and text-orientation.
///
/// - SeeAlso: [MDN Web Docs on border-block-style](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-style)
public enum BorderBlockStyle: Property {

  public static let property: String = "border-block-style"

  /// A single style for both block-start and block-end borders
  case all(LineStyle)

  /// Different styles for block-start and block-end borders
  case startEnd(LineStyle, LineStyle)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border block style with the same value for both start and end
  ///
  /// - Parameter style: The style for both block borders
  public init(_ style: LineStyle) {
    self = .all(style)
  }

  /// Creates a border block style with different values for start and end
  ///
  /// - Parameters:
  ///   - start: The style for the block-start border
  ///   - end: The style for the block-end border
  public init(start: LineStyle, end: LineStyle) {
    self = .startEnd(start, end)
  }

  public var description: String {
    switch self {
    case .all(let style):
      return style.description
    case .startEnd(let start, let end):
      return "\(start.description) \(end.description)"
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for creating BorderBlockStyle values
extension BorderBlockStyle {
  /// The default border style (none)
  public static let `default` = BorderBlockStyle(.none)

  /// Creates a none border style (invisible)
  public static let none = BorderBlockStyle(.none)

  /// Creates a hidden border style (invisible, high priority in border collapsing)
  public static let hidden = BorderBlockStyle(.hidden)

  /// Creates a solid border style
  public static let solid = BorderBlockStyle(.solid)

  /// Creates a dotted border style
  public static let dotted = BorderBlockStyle(.dotted)

  /// Creates a dashed border style
  public static let dashed = BorderBlockStyle(.dashed)

  /// Creates a double border style
  public static let double = BorderBlockStyle(.double)

  /// Creates a groove border style
  public static let groove = BorderBlockStyle(.groove)

  /// Creates a ridge border style
  public static let ridge = BorderBlockStyle(.ridge)

  /// Creates an inset border style
  public static let inset = BorderBlockStyle(.inset)

  /// Creates an outset border style
  public static let outset = BorderBlockStyle(.outset)
}
