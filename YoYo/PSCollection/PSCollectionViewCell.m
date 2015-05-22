//
// PSCollectionViewCell.m
//
// Copyright (c) 2012 Peter Shih (http://petershih.com)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PSCollectionViewCell.h"
#define MARGIN 0.0
@interface PSCollectionViewCell ()

@end

@implementation PSCollectionViewCell

@synthesize
object = _object;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)dealloc {
    self.object = nil;
    [super dealloc];
}

- (void)prepareForReuse {
}

- (void)fillViewWithObject:(id)object {
    self.object = object;
}

+ (CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth {
    CGFloat height = 0.0;
    int width = columnWidth - MARGIN * 2;
    
    height += MARGIN;
    
    // Image
    int objectWidth = [[object objectForKey:@"width"] intValue];
    int objectHeight = [[object objectForKey:@"height"] intValue];
    int scaledHeight = floorf(objectHeight / (objectWidth / width));
    height += scaledHeight;
    
    // Label
    
//    NSString *caption = [object objectForKey:@"name"]!=[NSNull null]? [object objectForKey:@"name"]:@"";
//    CGSize labelSize = CGSizeZero;
//    UIFont *labelFont = [UIFont boldSystemFontOfSize:14.0];
//    labelSize = [self getLabHeightWithText:caption labeFont1:labelFont labeSize1:CGSizeMake(width, INT_MAX)];
//    labelSize = [caption sizeWithFont:labelFont constrainedToSize:CGSizeMake(width, INT_MAX) lineBreakMode:UILineBreakModeWordWrap];
//    height += labelSize.height;
    
    height += MARGIN + 60;
    
    return height;
}
//
//+ (CGSize)getLabHeightWithText:(NSString *)text labeFont1:(UIFont *)font labeSize1:(CGSize)size{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
//    
//    CGSize labelSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//    return labelSize;
//}

@end
