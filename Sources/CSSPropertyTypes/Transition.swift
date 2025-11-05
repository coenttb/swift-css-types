//
//  Transition.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `transition` property is a shorthand property for setting the four transition properties
/// in a single declaration: `transition-property`, `transition-duration`, `transition-timing-function`,
/// and `transition-delay`.
///
/// Transitions enable you to define the transition between two states of an element. Different states
/// may be defined using pseudo-classes like :hover or :active or dynamically set using JavaScript.
///
/// Example:
/// ```swift
/// .transition(.config(.all, duration: .s(0.3), timingFunction: .ease)) // transition: all 0.3s ease
/// .transition(.config(.custom("opacity"), duration: .ms(200), timingFunction: .easeInOut, delay: .ms(100))) // transition: opacity 200ms ease-in-out 100ms
/// .transition(.global(.inherit)) // transition: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on transition](https://developer.mozilla.org/en-US/docs/Web/CSS/transition)
public enum Transition: Property {
    public static let property: String = "transition"

    /// A specific transition configuration
    case config(Configuration)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a new transition with the specified properties
    /// - Parameters:
    ///   - property: The property to transition (default is .all)
    ///   - duration: The duration of the transition (default is 0s)
    ///   - timingFunction: The timing function (default is .ease)
    ///   - delay: Optional delay before the transition starts
    ///   - behavior: Optional behavior for discrete properties
    public init(
        property: Property = .all,
        duration: Time = .zero,
        timingFunction: TimingFunction = .ease,
        delay: Time? = nil,
        behavior: Behavior? = nil
    ) {
        self = .config(
            Configuration(
                property: property,
                duration: duration,
                timingFunction: timingFunction,
                delay: delay,
                behavior: behavior
            )
        )
    }

    /// Represents a CSS transition property
    public typealias Property = TransitionProperty

    /// Represents a CSS transition timing function
    public typealias TimingFunction = TransitionTimingFunction

    /// Represents a CSS transition behavior
    public typealias Behavior = TransitionBehavior

    /// Represents a time value for transitions
    public typealias Time = CSSTypeTypes.Time

    /// A specific transition configuration
    public struct Configuration: Sendable, Hashable, CustomStringConvertible {
        /// The property or properties to which the transition applies
        public let property: Property

        /// The duration of the transition
        public let duration: Time

        /// The timing function that specifies the speed curve of the transition
        public let timingFunction: TimingFunction

        /// Optional delay before the transition starts
        public let delay: Time?

        /// Optional behavior for discrete properties
        public let behavior: Behavior?

        /// Creates a new transition configuration with the specified properties
        /// - Parameters:
        ///   - property: The property to transition
        ///   - duration: The duration of the transition
        ///   - timingFunction: The timing function
        ///   - delay: Optional delay before the transition starts
        ///   - behavior: Optional behavior for discrete properties
        public init(
            property: Property,
            duration: Time,
            timingFunction: TimingFunction,
            delay: Time? = nil,
            behavior: Behavior? = nil
        ) {
            self.property = property
            self.duration = duration
            self.timingFunction = timingFunction
            self.delay = delay
            self.behavior = behavior
        }

        public var description: String {
            var result = [property.description, duration.description, timingFunction.description]

            if let delay = delay {
                result.append(delay.description)
            }

            if let behavior = behavior {
                result.append(behavior.description)
            }

            return result.joined(separator: " ")
        }
    }
}

/// Provides string conversion for CSS output
extension Transition: CustomStringConvertible {
    /// Converts the transition to its CSS string representation
    public var description: String {
        switch self {
        case .config(let config):
            return config.description
        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods for common transition patterns
extension Transition {
    /// Factory method to create a transition for all properties
    /// - Parameters:
    ///   - duration: The duration of the transition
    ///   - timingFunction: The timing function (default is .ease)
    ///   - delay: Optional delay before the transition starts
    ///   - behavior: Optional behavior for discrete properties
    /// - Returns: A transition configured for all properties
    public static func all(
        duration: Time,
        timingFunction: TimingFunction = .ease,
        delay: Time? = nil,
        behavior: Behavior? = nil
    ) -> Transition {
        .config(
            Configuration(
                property: .all,
                duration: duration,
                timingFunction: timingFunction,
                delay: delay,
                behavior: behavior
            )
        )
    }

    /// Factory method to create a transition with no transition effect
    /// - Returns: A transition configured for no properties
    public static func none() -> Transition {
        .config(
            Configuration(
                property: .none,
                duration: .zero,
                timingFunction: .ease
            )
        )
    }

    /// Factory method to create a transition for a specific property
    /// - Parameters:
    ///   - propertyName: The name of the CSS property to transition
    ///   - duration: The duration of the transition
    ///   - timingFunction: The timing function (default is .ease)
    ///   - delay: Optional delay before the transition starts
    ///   - behavior: Optional behavior for discrete properties
    /// - Returns: A transition configured for the specified property
    public static func custom(
        _ propertyName: String,
        duration: Time,
        timingFunction: TimingFunction = .ease,
        delay: Time? = nil,
        behavior: Behavior? = nil
    ) -> Transition {
        .config(
            Configuration(
                property: .custom(.init(propertyName)),
                duration: duration,
                timingFunction: timingFunction,
                delay: delay,
                behavior: behavior
            )
        )
    }
}
