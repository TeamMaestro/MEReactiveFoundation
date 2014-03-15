//
//  NSArray+MERExtensionsTestCase.m
//  MEReactiveFoundation
//
//  Created by William Towe on 1/27/14.
//  Copyright (c) 2014 Maestro, LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <XCTest/XCTest.h>
#import "NSArray+MERExtensions.h"

@interface NSArray_MERExtensionsTestCase : XCTestCase

@end

@implementation NSArray_MERExtensionsTestCase

- (void)testMERTake {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@1];
    
    XCTAssertEqualObjects([src MER_take:1], dst);
}
- (void)testMERDrop {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@2,@3];
    
    XCTAssertEqualObjects([src MER_drop:1], dst);
}

- (void)testMERSplitAt {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@[@1],@[@2,@3]];
    
    XCTAssertEqualObjects([src MER_splitAt:1], dst);
}

- (void)testMERReverse {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@3,@2,@1];
    
    XCTAssertEqualObjects([src MER_reverse], dst);
}

- (void)testMERConcat {
    NSArray *src = @[@[@1,@2,@3],@[@1,@2,@3]];
    NSArray *dst = @[@1,@2,@3,@1,@2,@3];
    
    XCTAssertEqualObjects([src MER_concat], dst);
}
- (void)testMERConcatWith {
    NSArray *src1 = @[@1,@2,@3];
    NSArray *src2 = @[@4,@5,@6];
    NSArray *dst = @[@1,@2,@3,@4,@5,@6];
    
    XCTAssertEqualObjects([src1 MER_concatWith:src2], dst);
}

- (void)testMERSum {
    NSArray *src = @[@1,@2,@3];
    NSNumber *dst = @6;
    
    XCTAssertEqualObjects([src MER_sum], dst);
}
- (void)testMERSumDecimal {
    NSArray *src = @[[NSDecimalNumber one],[NSDecimalNumber decimalNumberWithString:@"2"],[NSDecimalNumber decimalNumberWithString:@"3"]];
    NSDecimalNumber *dst = [NSDecimalNumber decimalNumberWithString:@"6"];
    
    XCTAssertEqualObjects([src MER_sum], dst);
}
- (void)testMERMinimum {
    NSArray *src = @[@1,@2,@3];
    NSNumber *dst = @1;
    
    XCTAssertEqualObjects([src MER_minimum], dst);
}
- (void)testMERMaximum {
    NSArray *src = @[@1,@2,@3];
    NSNumber *dst = @3;
    
    XCTAssertEqualObjects([src MER_maximum], dst);
}

@end
