//
//  Gradient Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Gradient Tests")
struct GradientTests {
    
    @Test("Linear gradient with direction renders correctly")
    func testLinearGradientWithDirection() {
        let gradient = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue))
            ]
        )
        #expect(gradient.description == "linear-gradient(to right, red, blue)")
        
        let diagonalGradient = Gradient.linear(
            direction: .to(.bottomRight),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green))
            ]
        )
        #expect(diagonalGradient.description == "linear-gradient(to bottom right, yellow, green)")
    }
    
    @Test("Linear gradient with angle renders correctly")
    func testLinearGradientWithAngle() {
        let gradient = Gradient.linear(
            direction: .angle(.deg(45)),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue))
            ]
        )
        #expect(gradient.description == "linear-gradient(45deg, red, blue)")
        
        let radGradient = Gradient.linear(
            direction: .angle(.rad(1.57)),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green))
            ]
        )
        #expect(radGradient.description == "linear-gradient(1.57rad, yellow, green)")
    }
    
    @Test("Linear gradient with color stop positions renders correctly")
    func testLinearGradientWithColorStopPositions() {
        let gradient = Gradient.linear(
            direction: .to(.bottom),
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.yellow), at: .percentage(Percentage(50))),
                Gradient.ColorStop(.named(.blue), at: .percentage(Percentage(100)))
            ]
        )
        #expect(gradient.description == "linear-gradient(to bottom, red 0%, yellow 50%, blue 100%)")
        
        let gradientWithLengths = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .length(.px(0))),
                Gradient.ColorStop(.named(.blue), at: .length(.px(200)))
            ]
        )
        #expect(gradientWithLengths.description == "linear-gradient(to right, red 0px, blue 200px)")
    }
    
    @Test("Repeating linear gradient renders correctly")
    func testRepeatingLinearGradient() {
        let gradient = Gradient.repeatingLinear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.blue), at: .percentage(Percentage(25)))
            ]
        )
        #expect(gradient.description == "repeating-linear-gradient(to right, red 0%, blue 25%)")
    }
    
    @Test("Radial gradient with basic options renders correctly")
    func testRadialGradientWithBasicOptions() {
        let gradient = Gradient.radial(
            options: nil,
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green))
            ]
        )
        #expect(gradient.description == "radial-gradient(yellow, green)")
        
        let circleGradient = Gradient.radial(
            options: Gradient.RadialOptions(shape: .circle),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green))
            ]
        )
        #expect(circleGradient.description == "radial-gradient(circle, yellow, green)")
    }
    
    @Test("Radial gradient with complete options renders correctly")
    func testRadialGradientWithCompleteOptions() {
        let gradient = Gradient.radial(
            options: Gradient.RadialOptions(
                shape: .circle,
                size: .keyword(.closestCorner),
                at: .center
            ),
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green))
            ]
        )
        #expect(gradient.description == "radial-gradient(circle closest-corner at center, yellow, green)")
        
        let explicitSizeGradient = Gradient.radial(
            options: Gradient.RadialOptions(
                shape: .ellipse,
                size: .elliptical(radiusX: .percentage(Percentage(50)), radiusY: .percentage(Percentage(25))),
                at: .topLeft
            ),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue))
            ]
        )
        #expect(explicitSizeGradient.description == "radial-gradient(ellipse 50% 25% at top left, red, blue)")
    }
    
    @Test("Repeating radial gradient renders correctly")
    func testRepeatingRadialGradient() {
        let gradient = Gradient.repeatingRadial(
            options: Gradient.RadialOptions(shape: .circle),
            colorStops: [
                Gradient.ColorStop(.named(.yellow), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.green), at: .percentage(Percentage(20)))
            ]
        )
        #expect(gradient.description == "repeating-radial-gradient(circle, yellow 0%, green 20%)")
    }
    
    @Test("Conic gradient renders correctly")
    func testConicGradient() {
        let gradient = Gradient.conic(
            angle: nil,
            at: nil,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.blue))
            ]
        )
        #expect(gradient.description == "conic-gradient(red, yellow, blue)")
        
        let gradientWithOptions = Gradient.conic(
            angle: .deg(45),
            at: .center,
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.blue))
            ]
        )
        #expect(gradientWithOptions.description == "conic-gradient(from 45deg, at center, red, yellow, blue)")
    }
    
    @Test("Repeating conic gradient renders correctly")
    func testRepeatingConicGradient() {
        let gradient = Gradient.repeatingConic(
            angle: .deg(0),
            at: .center,
            colorStops: [
                Gradient.ColorStop(.named(.red), at: .percentage(Percentage(0))),
                Gradient.ColorStop(.named(.blue), at: .percentage(Percentage(25)))
            ]
        )
        #expect(gradient.description == "repeating-conic-gradient(from 0deg, at center, red 0%, blue 25%)")
    }
    
    @Test("Gradient factory methods work correctly")
    func testGradientFactoryMethods() {
        // Test linearGradient with direction
        let linearGradient = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )
        #expect(linearGradient.description == "linear-gradient(to right, red, blue)")
        
        // Test linearGradient with angle
        let angleGradient = Gradient.linearGradient(
            angle: .deg(45),
            colors: [.named(.red), .named(.blue)]
        )
        #expect(angleGradient.description == "linear-gradient(45deg, red, blue)")
        
        // Test radialGradient
        let radialGradient = Gradient.radialGradient(
            colors: [.named(.yellow), .named(.green)]
        )
        #expect(radialGradient.description == "radial-gradient(yellow, green)")
        
        // Test radialGradient with options
        let radialWithOptions = Gradient.radialGradient(
            shape: .circle,
            size: .keyword(.closestCorner),
            at: .center,
            colors: [.named(.yellow), .named(.green)]
        )
        #expect(radialWithOptions.description == "radial-gradient(circle closest-corner at center, yellow, green)")
        
        // Test conicGradient
        let conicGradient = Gradient.conicGradient(
            colors: [.named(.red), .named(.yellow), .named(.blue)]
        )
        #expect(conicGradient.description == "conic-gradient(red, yellow, blue)")
        
        // Test conicGradient with options
        let conicWithOptions = Gradient.conicGradient(
            from: .deg(45),
            at: .center,
            colors: [.named(.red), .named(.yellow), .named(.blue)]
        )
        #expect(conicWithOptions.description == "conic-gradient(from 45deg, at center, red, yellow, blue)")
    }
    
    @Test("Gradient with color interpolation method renders correctly")
    func testGradientWithColorInterpolation() {
        let gradient = Gradient.linear(
            direction: .to(.right),
            colorStops: [
                Gradient.ColorStop(.named(.red)),
                Gradient.ColorStop(.named(.blue))
            ],
            interpolation: .rectangular(.srgb)
        )
        #expect(gradient.description == "linear-gradient(in srgb, to right, red, blue)")
        
        let hslGradient = Gradient.radial(
            options: nil,
            colorStops: [
                Gradient.ColorStop(.named(.yellow)),
                Gradient.ColorStop(.named(.green))
            ],
            interpolation: .polar(.hsl, .shorter)
        )
        #expect(hslGradient.description == "radial-gradient(in hsl shorter hue, yellow, green)")
    }
    
    @Test("Gradient conforms to Hashable")
    func testHashable() {
        let gradient1 = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )
        
        let gradient2 = Gradient.linearGradient(
            to: .right,
            colors: [.named(.red), .named(.blue)]
        )
        
        let gradient3 = Gradient.linearGradient(
            to: .bottom,
            colors: [.named(.red), .named(.blue)]
        )
        
        #expect(gradient1 == gradient2)
        #expect(gradient1 != gradient3)
    }
}
