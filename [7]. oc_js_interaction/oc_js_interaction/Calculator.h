//
//  Calculator.h
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSExportProtocol <JSExport>

//将OC的方法名转换为JS的方法名
JSExportAs(add, - (NSInteger)a:(NSInteger)a addB:(NSInteger)b);
JSExportAs(subtract, - (NSInteger)a:(NSInteger)a minusB:(NSInteger)b);

@property (nonatomic, assign) NSInteger sum;
@property (nonatomic, assign) NSInteger subtraction;

@end


@interface Calculator : NSObject<JSExportProtocol>
@end
