//
//  MERFoldTestCase.m
//  MEReactiveFoundation
//
//  Created by William Towe on 1/24/14.
//  Copyright (c) 2014 Maestro, LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <XCTest/XCTest.h>
#import "MERFold.h"

@interface MERFoldTestCase : XCTestCase

@end

@implementation MERFoldTestCase

- (void)testMERFoldLeft {
    NSArray *src = @[@1,@2,@3];
    NSNumber *dst = @6;
    NSNumber *start = @0;
    
    XCTAssertEqualObjects(MERFoldLeft(src, start, ^id(id accumulator, id value, BOOL *stop) {
        return @([accumulator unsignedIntegerValue] + [value unsignedIntegerValue]);
    }), dst);
}
- (void)testMERFoldLeftDictionary {
    NSDictionary *src = @{@1: @"one",
                          @2: @"two",
                          @3: @"three"};
    NSNumber *dst = @6;
    NSNumber *start = @0;
    
    XCTAssertEqualObjects(MERFoldLeftDictionary(src, start, ^id(id accumulator, id<NSCopying> key, id value, BOOL *stop) {
        return @([accumulator unsignedIntegerValue] + [(id)key unsignedIntegerValue]);
    }), dst);
}
- (void)testMERFoldRight {
    NSArray *src = @[@1,@2,@3];
    NSNumber *dst = @-3;
    NSNumber *start = src.lastObject;
    
    XCTAssertEqualObjects(MERFoldRight(src, start, ^id(id accumulator, id value, BOOL *stop) {
        return @([accumulator integerValue] - [value integerValue]);
    }), dst);
}

- (void)testMERAny {
    NSArray *src = @[@1,@2,@3];
    
    XCTAssertTrue(MERAny(src, ^BOOL(id value) {
        return ([value integerValue] % 2 == 0);
    }));
}
- (void)testMERAnyDictionary {
    NSDictionary *src = @{@1: @"one",
                          @2: @"two",
                          @3: @"three"};
    
    XCTAssertTrue(MERAnyDictionary(src, ^BOOL(id<NSCopying> key, id value) {
        return [value isEqualToString:@"two"];
    }));
}

- (void)testMERAll {
    NSArray *src = @[@2,@4,@6];
    
    XCTAssertTrue(MERAll(src, ^BOOL(id value) {
        return ([value integerValue] % 2 == 0);
    }));
}
- (void)testMERAllDictionary {
    NSDictionary *src = @{@1: @"two",
                          @2: @"two",
                          @3: @"two"};
    
    XCTAssertTrue(MERAllDictionary(src, ^BOOL(id<NSCopying> key, id value) {
        return [value isEqualToString:@"two"];
    }));
}

@end
