//
//  ScrollbarGutter.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The `scrollbar-gutter` CSS property allows authors to reserve space for the scrollbar,
/// preventing unwanted layout changes as the content grows while also avoiding unnecessary
/// visuals when scrolling isn't needed.
///
/// An element's scrollbar gutter is the space between the inner border edge and the outer
/// padding edge, where the browser may display a scrollbar.
///
/// Example:
/// ```css
/// scrollbar-gutter: stable;               /* Reserve space for scrollbar */
/// scrollbar-gutter: stable both-edges;    /* Reserve space on both edges */
/// ```
public enum ScrollbarGutter: Property {
  public static let property: String = "scrollbar-gutter"

  /// Classic scrollbars create a gutter when overflow is scroll, or when overflow is auto
  /// and the box is overflowing. Overlay scrollbars do not consume space.
  case auto

  /// When using classic scrollbars, the gutter will be present if overflow is auto, scroll,
  /// or hidden even if the box is not overflowing.
  case stable

  /// Similar to stable, but if a gutter is present on one of the inline edges of the box,
  /// another will be present on the opposite edge as well.
  case stableBothEdges

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto: return "auto"
    case .stable: return "stable"
    case .stableBothEdges: return "stable both-edges"
    case .global(let global): return global.description
    }
  }
}
