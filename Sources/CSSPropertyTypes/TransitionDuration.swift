//
//  TransitionDuration.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `transition-duration` property specifies the duration of a transition effect.
///
/// This property sets how long a transition animation should take to complete. By default,
/// the value is 0s, meaning that no animation will occur.
///
/// Example:
/// ```swift
/// .transitionDuration(.time(.s(0.3)))  // transition-duration: 0.3s
/// .transitionDuration(.time(.ms(500))) // transition-duration: 500ms
/// .transitionDuration(.list([.s(1), .ms(500)])) // transition-duration: 1s, 500ms
/// ```
///
/// - SeeAlso: [MDN Web Docs on transition-duration](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-duration)
public enum TransitionDuration: Property {
    public static let property: String = "transition-duration"
    
    /// A single time duration
    case time(Time)
    
    /// Multiple time durations for different properties
    case list([Time])
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .time(let time):
            return time.description
        case .list(let times):
            return times.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
    
    /// Creates a transition duration with a time value
    public init(_ time: Time) {
        self = .time(time)
    }
    
    /// Creates a transition duration with multiple time values
    public init(_ times: [Time]) {
        if times.isEmpty {
            self = .time(.zero)
        } else if times.count == 1 {
            self = .time(times[0])
        } else {
            self = .list(times)
        }
    }
    
    /// Creates a transition duration with multiple time values
    public init(_ times: Time...) {
        self.init(times)
    }
    
    /// Creates a transition duration with a value in seconds
    public static func seconds(_ value: Double) -> TransitionDuration {
        .time(.s(value))
    }
    
    /// Creates a transition duration with a value in milliseconds
    public static func milliseconds(_ value: Double) -> TransitionDuration {
        .time(.ms(value))
    }
    
    /// Zero duration (no transition)
    public static let zero = TransitionDuration(.zero)
}

/// Convenience access through numeric literals
extension TransitionDuration: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a duration in seconds from an integer literal
    public init(integerLiteral value: Int) {
        self = .time(Time(integerLiteral: value))
    }
    
    /// Creates a duration in seconds from a floating point literal
    public init(floatLiteral value: Double) {
        self = .time(Time(floatLiteral: value))
    }
}
