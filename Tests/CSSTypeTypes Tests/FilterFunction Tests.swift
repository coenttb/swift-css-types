//
//  FilterFunction Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("FilterFunction Tests")
struct FilterFunctionTests {
    
    @Test("Blur filter renders correctly")
    func testBlurFilter() {
        let blur = FilterFunction.blur(.px(5))
        #expect(blur.description == "blur(5px)")
        
        let blurEm = FilterFunction.blur(.em(0.5))
        #expect(blurEm.description == "blur(0.5em)")
    }
    
    @Test("Brightness filter renders correctly")
    func testBrightnessFilter() {
        // Values between 0-1 should render as percentages
        let brightness50 = FilterFunction.brightness(0.5)
        #expect(brightness50.description == "brightness(50%)")
        
        // Values outside 0-1 should render as decimals
        let brightness150 = FilterFunction.brightness(1.5)
        #expect(brightness150.description == "brightness(1.5)")
        
        let brightness0 = FilterFunction.brightness(0)
        #expect(brightness0.description == "brightness(0%)")
    }
    
    @Test("Contrast filter renders correctly")
    func testContrastFilter() {
        let contrast75 = FilterFunction.contrast(0.75)
        #expect(contrast75.description == "contrast(75%)")
        
        let contrast200 = FilterFunction.contrast(2)
        #expect(contrast200.description == "contrast(2)")
    }
    
    @Test("Drop shadow filter renders correctly")
    func testDropShadowFilter() {
        let basicShadow = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: nil,
            color: nil
        )
        #expect(basicShadow.description == "drop-shadow(5px 5px)")
        
        let shadowWithBlur = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: nil
        )
        #expect(shadowWithBlur.description == "drop-shadow(5px 5px 10px)")
        
        let fullShadow = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )
        #expect(fullShadow.description == "drop-shadow(5px 5px 10px black)")
    }
    
    @Test("Grayscale filter renders correctly")
    func testGrayscaleFilter() {
        let grayscale50 = FilterFunction.grayscale(0.5)
        #expect(grayscale50.description == "grayscale(50%)")
        
        let grayscale100 = FilterFunction.grayscale(1.0)
        #expect(grayscale100.description == "grayscale(100%)")
    }
    
    @Test("Hue-rotate filter renders correctly")
    func testHueRotateFilter() {
        let rotate90 = FilterFunction.hueRotate(.deg(90))
        #expect(rotate90.description == "hue-rotate(90deg)")
        
        let rotateTurn = FilterFunction.hueRotate(.turn(0.25))
        #expect(rotateTurn.description == "hue-rotate(0.25turn)")
    }
    
    @Test("Invert filter renders correctly")
    func testInvertFilter() {
        let invert75 = FilterFunction.invert(0.75)
        #expect(invert75.description == "invert(75%)")
        
        let invertFull = FilterFunction.invert(1.0)
        #expect(invertFull.description == "invert(100%)")
    }
    
    @Test("Opacity filter renders correctly")
    func testOpacityFilter() {
        let opacity50 = FilterFunction.opacity(0.5)
        #expect(opacity50.description == "opacity(50%)")
        
        let opacityFull = FilterFunction.opacity(1.0)
        #expect(opacityFull.description == "opacity(100%)")
    }
    
    @Test("Saturate filter renders correctly")
    func testSaturateFilter() {
        let saturate50 = FilterFunction.saturate(0.5)
        #expect(saturate50.description == "saturate(50%)")
        
        let saturate200 = FilterFunction.saturate(2.0)
        #expect(saturate200.description == "saturate(2)")
    }
    
    @Test("Sepia filter renders correctly")
    func testSepiaFilter() {
        let sepia60 = FilterFunction.sepia(0.6)
        #expect(sepia60.description == "sepia(60%)")
        
        let sepiaFull = FilterFunction.sepia(1.0)
        #expect(sepiaFull.description == "sepia(100%)")
    }
    
    @Test("FilterFunction conforms to Equatable")
    func testEquatable() {
        let blur1 = FilterFunction.blur(.px(5))
        let blur2 = FilterFunction.blur(.px(5))
        let blur3 = FilterFunction.blur(.px(10))
        
        #expect(blur1 == blur2)
        #expect(blur1 != blur3)
        
        let brightness1 = FilterFunction.brightness(0.5)
        #expect(blur1 != brightness1)
        
        let shadow1 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )
        
        let shadow2 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(10),
            color: .named(.black)
        )
        
        let shadow3 = FilterFunction.dropShadow(
            offsetX: .px(5),
            offsetY: .px(5),
            blurRadius: .px(5),
            color: .named(.black)
        )
        
        #expect(shadow1 == shadow2)
        #expect(shadow1 != shadow3)
    }
    
    @Test("FilterFunction is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS filter strings
        let filter = "filter: \(FilterFunction.blur(.px(10))) \(FilterFunction.brightness(1.2))"
        #expect(filter == "filter: blur(10px) brightness(1.2)")
        
        let backdropFilter = "backdrop-filter: \(FilterFunction.grayscale(1.0)) \(FilterFunction.contrast(1.1))"
        #expect(backdropFilter == "backdrop-filter: grayscale(100%) contrast(1.1)")
    }
}
