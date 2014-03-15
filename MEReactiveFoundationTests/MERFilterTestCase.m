//
//  MERFilterTestCase.m
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
#import "MERFilter.h"

@interface MERFilterTestCase : XCTestCase

@end

@implementation MERFilterTestCase

- (void)testMERFilter {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@1];
    
    XCTAssertEqualObjects(MERFilter(src, ^BOOL(id value) {
        return ([value unsignedIntegerValue] == 1);
    }), dst);
}
- (void)testMERFilterDictionary {
    NSDictionary *src = @{@1: @"one",
                          @2: @"two",
                          @3: @"three"};
    NSDictionary *dst = @{@2: @"two"};
    
    XCTAssertEqualObjects(MERFilterDictionary(src, ^BOOL(id<NSCopying> key, NSString *value) {
        return [value isEqualToString:@"two"];
    }), dst);
}

- (void)testMERFind {
    NSArray *src = @[@1,@2,@3];
    NSNumber *dst = @1;
    
    XCTAssertEqualObjects(MERFind(src, ^BOOL(id value) {
        return ([value unsignedIntegerValue] == 1);
    }), dst);
}
- (void)testMERFindKeyValue {
    NSDictionary *src = @{@1: @"one",
                          @2: @"two",
                          @3: @"three"};
    NSArray *dst = @[@2,@"two"];
    
    XCTAssertEqualObjects(MERFindKeyValue(src, ^BOOL(id<NSCopying> key, NSString *value) {
        return [value isEqualToString:@"two"];
    }), dst);
}
- (void)testMERFindIndex {
    NSArray *src = @[@1,@2,@3];
    NSUInteger dst = 1;
    
    XCTAssertEqual(MERFindIndex(src, ^BOOL(id value) {
        return ([value unsignedIntegerValue] == 2);
    }), dst);
}
- (void)testMERFindWithIndex {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@2,@1];
    
    XCTAssertEqualObjects(MERFindWithIndex(src, ^BOOL(id value, NSUInteger index) {
        return ([value unsignedIntegerValue] == 2);
    }), dst);
}

@end
