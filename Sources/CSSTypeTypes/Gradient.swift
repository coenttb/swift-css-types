import Foundation

/// Represents a CSS gradient, a special type of image that consists of a progressive transition between colors.
///
/// CSS provides several types of gradients:
/// - Linear gradients: transition colors progressively along an imaginary line
/// - Radial gradients: transition colors progressively from a center point
/// - Conic gradients: transition colors progressively around a circle
/// - Repeating gradients: repeating versions of the above gradient types
///
/// Example:
/// ```swift
/// // Linear gradient from top to bottom (red to blue)
/// .backgroundImage(.linearGradient(to: .bottom, colors: [.red, .blue]))
///
/// // Radial gradient from center (yellow to green)
/// .backgroundImage(.radialGradient(colors: [.yellow, .green]))
///
/// // Conic gradient from center (pink, coral, lime)
/// .backgroundImage(.conicGradient(from: .degree(45), colors: [.pink, .coral, .lime]))
/// ```
///
/// - Note: CSS gradients have no intrinsic dimensions; their size matches the element they're applied to.
///
/// - SeeAlso: [MDN Web Docs on gradients](https://developer.mozilla.org/en-US/docs/Web/CSS/gradient)
public enum Gradient: Sendable, Hashable {
    /// Represents directions for linear gradients
    public enum Direction: Sendable, Hashable, AngleConvertible {
        /// Direction specified by an angle
        case angle(Angle)

        /// Direction specified using the "to" keyword followed by sides/corners
        case to(Side)

        /// Represents sides or corners for the "to" keyword
        public enum Side: String, Sendable, Hashable, CaseIterable {
            /// Top edge
            case top

            /// Right edge
            case right

            /// Bottom edge
            case bottom

            /// Left edge
            case left

            /// Top-right corner
            case topRight = "top right"

            /// Bottom-right corner
            case bottomRight = "bottom right"

            /// Bottom-left corner
            case bottomLeft = "bottom left"

            /// Top-left corner
            case topLeft = "top left"
        }
    }

    /// Represents a color stop in a gradient
    public struct ColorStop: Sendable, Hashable {
        /// The color of the stop
        public let color: Color

        /// The position of the stop (optional)
        public let position: LengthPercentage?

        /// Creates a color stop with an optional position
        public init(_ color: Color, at position: LengthPercentage? = nil) {
            self.color = color
            self.position = position
        }
    }

    /// Represents options for radial gradients
    public struct RadialOptions: Sendable, Hashable {
        /// The shape of the gradient
        public enum Shape: String, Sendable, Hashable {
            /// Circular shape (equal distance from center)
            case circle

            /// Elliptical shape (may be stretched)
            case ellipse
        }

        /// Size keywords for radial gradients
        public enum Size: Sendable, Hashable {
            /// Size specified by keywords
            case keyword(Keyword)

            /// Size specified by explicit dimensions
            case explicit(radius: LengthPercentage)

            /// Size specified by explicit dimensions for elliptical gradients
            case elliptical(radiusX: LengthPercentage, radiusY: LengthPercentage)

            /// Keywords for radial gradient sizing
            public enum Keyword: String, Sendable, Hashable {
                /// Gradient ends at the closest side from the center
                case closestSide = "closest-side"

                /// Gradient ends at the closest corner from the center
                case closestCorner = "closest-corner"

                /// Gradient ends at the farthest side from the center
                case farthestSide = "farthest-side"

                /// Gradient ends at the farthest corner from the center
                case farthestCorner = "farthest-corner"
            }
        }

        /// The shape of the gradient (circle or ellipse)
        public let shape: Shape?

        /// The size of the gradient
        public let size: Size?

        /// The position of the gradient center
        public let position: Position?

        /// Creates radial gradient options
        public init(shape: Shape? = nil, size: Size? = nil, at position: Position? = nil) {
            self.shape = shape
            self.size = size
            self.position = position
        }
    }

    /// A linear gradient
    case linear(
        direction: Direction?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    /// A repeating linear gradient
    case repeatingLinear(
        direction: Direction?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    /// A radial gradient
    case radial(
        options: RadialOptions?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    /// A repeating radial gradient
    case repeatingRadial(
        options: RadialOptions?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    /// A conic gradient
    case conic(
        angle: Angle?,
        at: Position?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )

    /// A repeating conic gradient
    case repeatingConic(
        angle: Angle?,
        at: Position?,
        colorStops: [ColorStop],
        interpolation: ColorInterpolationMethod? = nil
    )
}

/// Provides string conversion for CSS output
extension Gradient: CustomStringConvertible {
    /// Converts the gradient to its CSS string representation
    public var description: String {
        switch self {
        case .linear(let direction, let colorStops, let interpolation):
            var result = "linear-gradient("

            // Add interpolation method if specified
            if let interpolation = interpolation {
                result += "\(interpolation), "
            }

            // Add direction if specified
            if let direction = direction {
                switch direction {
                case .angle(let angle):
                    result += "\(angle), "
                case .to(let side):
                    result += "to \(side.rawValue), "
                }
            }

            // Add color stops
            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .repeatingLinear(let direction, let colorStops, let interpolation):
            var result = "repeating-linear-gradient("

            // Add interpolation method if specified
            if let interpolation = interpolation {
                result += "\(interpolation), "
            }

            // Add direction if specified
            if let direction = direction {
                switch direction {
                case .angle(let angle):
                    result += "\(angle), "
                case .to(let side):
                    result += "to \(side.rawValue), "
                }
            }

            // Add color stops
            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .radial(let options, let colorStops, let interpolation):
            var result = "radial-gradient("

            // Add interpolation method if specified
            if let interpolation = interpolation {
                result += "\(interpolation), "
            }

            // Add options if specified
            if let options = options {
                var optionsString = ""

                // Add shape if specified
                if let shape = options.shape {
                    optionsString += shape.rawValue
                    if options.size != nil {
                        optionsString += " "
                    }
                }

                // Add size if specified
                if let size = options.size {
                    switch size {
                    case .keyword(let keyword):
                        optionsString += keyword.rawValue
                    case .explicit(let radius):
                        optionsString += "\(radius)"
                    case .elliptical(let radiusX, let radiusY):
                        optionsString += "\(radiusX) \(radiusY)"
                    }
                }

                // Add position if specified
                if let position = options.position {
                    if !optionsString.isEmpty {
                        optionsString += " "
                    }
                    optionsString += "at \(position)"
                }

                if !optionsString.isEmpty {
                    result += optionsString + ", "
                }
            }

            // Add color stops
            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .repeatingRadial(let options, let colorStops, let interpolation):
            var result = "repeating-radial-gradient("

            // Add interpolation method if specified
            if let interpolation = interpolation {
                result += "\(interpolation), "
            }

            // Add options if specified
            if let options = options {
                var optionsString = ""

                // Add shape if specified
                if let shape = options.shape {
                    optionsString += shape.rawValue
                    if options.size != nil {
                        optionsString += " "
                    }
                }

                // Add size if specified
                if let size = options.size {
                    switch size {
                    case .keyword(let keyword):
                        optionsString += keyword.rawValue
                    case .explicit(let radius):
                        optionsString += "\(radius)"
                    case .elliptical(let radiusX, let radiusY):
                        optionsString += "\(radiusX) \(radiusY)"
                    }
                }

                // Add position if specified
                if let position = options.position {
                    if !optionsString.isEmpty {
                        optionsString += " "
                    }
                    optionsString += "at \(position)"
                }

                if !optionsString.isEmpty {
                    result += optionsString + ", "
                }
            }

            // Add color stops
            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .conic(let angle, let position, let colorStops, let interpolation):
            var result = "conic-gradient("

            // Add interpolation method if specified
            if let interpolation = interpolation {
                result += "\(interpolation), "
            }

            // Add angle if specified
            if let angle = angle {
                result += "from \(angle), "
            }

            // Add position if specified
            if let position = position {
                result += "at \(position), "
            }

            // Add color stops
            result += formatColorStops(colorStops)
            result += ")"
            return result

        case .repeatingConic(let angle, let position, let colorStops, let interpolation):
            var result = "repeating-conic-gradient("

            // Add interpolation method if specified
            if let interpolation = interpolation {
                result += "\(interpolation), "
            }

            // Add angle if specified
            if let angle = angle {
                result += "from \(angle), "
            }

            // Add position if specified
            if let position = position {
                result += "at \(position), "
            }

            // Add color stops
            result += formatColorStops(colorStops)
            result += ")"
            return result
        }
    }

    /// Helper function to format color stops for gradients
    private func formatColorStops(_ stops: [ColorStop]) -> String {
        return stops.map { stop in
            if let position = stop.position {
                return "\(stop.color) \(position)"
            } else {
                return stop.color.description
            }
        }.joined(separator: ", ")
    }
}

/// Convenience factory methods for creating gradient values
extension Gradient {
    /// Creates a linear gradient with direction and color stops
    ///
    /// - Parameters:
    ///   - to: The direction of the gradient using the "to" keyword
    ///   - colors: The colors for the gradient
    /// - Returns: A linear gradient
    public static func linearGradient(to side: Direction.Side, colors: [Color]) -> Gradient {
        return .linear(
            direction: .to(side),
            colorStops: colors.map { ColorStop($0) }
        )
    }

    /// Creates a linear gradient with angle and color stops
    ///
    /// - Parameters:
    ///   - angle: The angle of the gradient
    ///   - colors: The colors for the gradient
    /// - Returns: A linear gradient
    public static func linearGradient(angle: Angle, colors: [Color]) -> Gradient {
        return .linear(
            direction: .angle(angle),
            colorStops: colors.map { ColorStop($0) }
        )
    }

    /// Creates a radial gradient with color stops
    ///
    /// - Parameters:
    ///   - colors: The colors for the gradient
    /// - Returns: A radial gradient
    public static func radialGradient(colors: [Color]) -> Gradient {
        return .radial(
            options: nil,
            colorStops: colors.map { ColorStop($0) }
        )
    }

    /// Creates a radial gradient with shape, size, position and color stops
    ///
    /// - Parameters:
    ///   - shape: The shape of the gradient (circle or ellipse)
    ///   - size: The size of the gradient
    ///   - position: The position of the gradient center
    ///   - colors: The colors for the gradient
    /// - Returns: A radial gradient
    public static func radialGradient(
        shape: RadialOptions.Shape,
        size: RadialOptions.Size? = nil,
        at position: Position? = nil,
        colors: [Color]
    ) -> Gradient {
        return .radial(
            options: RadialOptions(shape: shape, size: size, at: position),
            colorStops: colors.map { ColorStop($0) }
        )
    }

    /// Creates a conic gradient with color stops
    ///
    /// - Parameters:
    ///   - colors: The colors for the gradient
    /// - Returns: A conic gradient
    public static func conicGradient(colors: [Color]) -> Gradient {
        return .conic(
            angle: nil,
            at: nil,
            colorStops: colors.map { ColorStop($0) }
        )
    }

    /// Creates a conic gradient with angle, position and color stops
    ///
    /// - Parameters:
    ///   - from: The starting angle of the gradient
    ///   - at: The position of the gradient center
    ///   - colors: The colors for the gradient
    /// - Returns: A conic gradient
    public static func conicGradient(
        from angle: Angle? = nil,
        at position: Position? = nil,
        colors: [Color]
    ) -> Gradient {
        return .conic(
            angle: angle,
            at: position,
            colorStops: colors.map { ColorStop($0) }
        )
    }
}
