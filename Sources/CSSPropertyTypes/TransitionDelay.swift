//
//  TransitionDelay.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `transition-delay` property specifies the amount of time to wait before starting
/// a transition effect.
///
/// This property allows you to define when the transition will start. It can be specified as:
/// - A positive value: delays the start of the transition by the specified time
/// - Zero: the transition starts immediately
/// - A negative value: the transition starts immediately but partway through its cycle
///
/// Example:
/// ```swift
/// .transitionDelay(.time(.s(0.5)))  // transition-delay: 0.5s
/// .transitionDelay(.time(.ms(100))) // transition-delay: 100ms
/// .transitionDelay(.list([.s(1), .ms(500)])) // transition-delay: 1s, 500ms
/// ```
///
/// - SeeAlso: [MDN Web Docs on transition-delay](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-delay)
public enum TransitionDelay: Property {

    public static let property: String = "transition-delay"

    /// A single time delay
    case time(Time)

    /// Multiple time delays for different properties
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

    /// Creates a transition delay with a time value
    public init(_ time: Time) {
        self = .time(time)
    }

    /// Creates a transition delay with multiple time values
    public init(_ times: [Time]) {
        if times.isEmpty {
            self = .time(.zero)
        } else if times.count == 1 {
            self = .time(times[0])
        } else {
            self = .list(times)
        }
    }

    /// Creates a transition delay with multiple time values
    public init(_ times: Time...) {
        self.init(times)
    }

    /// Creates a transition delay with a value in seconds
    public static func seconds(_ value: Double) -> TransitionDelay {
        .time(.s(value))
    }

    /// Creates a transition delay with a value in milliseconds
    public static func milliseconds(_ value: Double) -> TransitionDelay {
        .time(.ms(value))
    }

    /// No delay (immediate transition)
    public static let zero = TransitionDelay(.zero)
}

/// Convenience access through numeric literals
extension TransitionDelay: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a delay in seconds from an integer literal
    public init(integerLiteral value: Int) {
        self = .time(Time(integerLiteral: value))
    }

    /// Creates a delay in seconds from a floating point literal
    public init(floatLiteral value: Double) {
        self = .time(Time(floatLiteral: value))
    }
}
