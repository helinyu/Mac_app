//
//  KMAbbreviationMacroExpress.h
//  xndm_proj
//
//  Created by Aka on 2019/10/23.
//  Copyright © 2019 Linfeng Song. All rights reserved.
//

#ifndef KMAbbreviationMacroExpress_h
#define KMAbbreviationMacroExpress_h

// 全局变量
#define kConstString(kConstVar, identfierString) static NSString *const kConstVar = identfierString;
#define kConstSameNameString(kConstVar) static NSString *const kConstVar = @#kConstVar;
#define kConstInterger(kConstVar, identfierInterger) static NSInteger const kConstVar = identfierInterger;
#define kConstCGFloat(kConstVar, identfierCGFloat) static CGFloat const kConstVar = identfierCGFloat;

#endif /* KMAbbreviationMacroExpress_h */
