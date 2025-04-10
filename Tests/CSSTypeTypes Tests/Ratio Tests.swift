//
//  Ratio Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Ratio Tests")
struct RatioTests {
    
    @Test("Basic ratio values render correctly")
    func testBasicRatioValues() {
        let ratio = Ratio(16, 9)
        #expect(ratio.description == "16 / 9")
        
        let squareRatio = Ratio(1, 1)
        // Square ratio has height = 1, so it renders as "1" not "1 / 1"
        #expect(squareRatio.description == "1")
        
        let movieRatio = Ratio(185, 100)
        #expect(movieRatio.description == "185 / 100")
    }
    
    @Test("Single value ratio renders correctly")
    func testSingleValueRatio() {
        let ratio = Ratio(1.5)
        #expect(ratio.description == "1.5")
        
        let integerRatio = Ratio(2)
        #expect(integerRatio.description == "2")
    }
    
    @Test("Literal initializers work correctly")
    func testLiteralInitializers() {
        let intRatio: Ratio = 4
        #expect(intRatio.description == "4")
        #expect(intRatio.width == 4)
        #expect(intRatio.height == 1)
        
        let floatRatio: Ratio = 1.78
        #expect(floatRatio.description == "1.78")
        #expect(floatRatio.width == 1.78)
        #expect(floatRatio.height == 1)
    }
    
    @Test("Predefined aspect ratios work correctly")
    func testPredefinedRatios() {
        #expect(Ratio.square.description == "1")  // Square has height = 1, so it's just "1"
        #expect(Ratio.tv.description == "4 / 3")
        #expect(Ratio.widescreen.description == "16 / 9")
        #expect(Ratio.ultrawide.description == "21 / 9")
        #expect(Ratio.movie.description == "185 / 100")
        #expect(Ratio.cinemascope.description == "239 / 100")
    }
    
    @Test("Quotient works correctly")
    func testQuotient() {
        let ratio = Ratio(16, 9)
        #expect(ratio.quotient == 16.0 / 9.0)
        
        let singleRatio = Ratio(1.5)
        #expect(singleRatio.quotient == 1.5)
    }
    
    @Test("Comparison works correctly")
    func testComparison() {
        let ratio1 = Ratio(4, 3)  // ~1.33
        let ratio2 = Ratio(16, 9) // ~1.78
        
        #expect(ratio1 < ratio2)
        #expect(ratio2 > ratio1)
        #expect(ratio1 != ratio2)
        
        let ratio3 = Ratio(4, 3)
        #expect(ratio1 == ratio3)
    }
    
    @Test("Inverse works correctly")
    func testInverse() {
        let ratio = Ratio(16, 9)
        let inverse = ratio.inverse
        
        #expect(inverse.width == 9)
        #expect(inverse.height == 16)
        #expect(inverse.description == "9 / 16")
    }
    
    @Test("Simplification works correctly")
    func testSimplification() {
        let ratio = Ratio(4, 2)
        let simplified = ratio.simplified()
        
        #expect(simplified.width == 2)
        #expect(simplified.height == 1)
        #expect(simplified.description == "2")
        
        let ratio2 = Ratio(16, 4)
        let simplified2 = ratio2.simplified()
        
        #expect(simplified2.width == 4)
        #expect(simplified2.height == 1)
        #expect(simplified2.description == "4")
    }
    
//    @Test("Preconditions are enforced")
//    func testPreconditions() {
//        #expect(throws: {
//            _ = Ratio(-1, 2)
//        })
//        
//        #expect(throws: {
//            _ = Ratio(2, -1)
//        })
//        
//        #expect(throws: {
//            _ = Ratio(-5)
//        })
//    }
}
