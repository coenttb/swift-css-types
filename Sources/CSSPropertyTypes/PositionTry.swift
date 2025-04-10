//
//  PositionTry.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `position-try` property is a shorthand that sets both `position-try-order` and 
/// `position-try-fallbacks` properties.
///
/// This property allows you to specify how and when alternative positioning should be applied to
/// anchor-positioned elements that would otherwise overflow their containing element or the viewport.
///
/// Example:
/// ```swift
/// .positionTry(.order(.normal), .fallbacks(.none))                  // position-try: normal none
/// .positionTry(.fallbacks(.tactic(.flipBlock)))                     // position-try: normal flip-block
/// .positionTry(.order(.mostHeight), .fallbacks(.customOption("--my-option")))  // position-try: most-height --my-option
/// ```
///
/// - Note: This is an experimental property and may not be fully supported across all browsers.
///
/// - SeeAlso: [MDN Web Docs on position-try](https://developer.mozilla.org/en-US/docs/Web/CSS/position-try)
public enum PositionTry: Property {
    public static let property: String = "position-try"
    /// Setting both order and fallbacks properties
    case combined(PositionTryOrder, PositionTryFallbacks)
    
    /// Setting just the order property
    case order(PositionTryOrder)
    
    /// Setting just the fallbacks property
    case fallbacks(PositionTryFallbacks)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .combined(let order, let fallbacks):
            return "\(order.description) \(fallbacks.description)"
        case .order(let order):
            return order.description
        case .fallbacks(let fallbacks):
            return fallbacks.description
        case .global(let global):
            return global.description
        }
    }
    
    /// Create a position-try with order and fallbacks
    public static func orderAndFallbacks(order: PositionTryOrder, fallbacks: PositionTryFallbacks) -> PositionTry {
        .combined(order, fallbacks)
    }
}
