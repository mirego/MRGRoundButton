//
// Copyright (c) 2014-2017, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import "MRGRoundButton.h"

#import <MCUIImageAdvanced/UIImage+MCRetina.h>
#import <MCUIImageAdvanced/UIImage+MCFilePath.h>

@interface MRGRoundButton ()
@property (nonatomic) BOOL needsUpdate;
@end

@implementation MRGRoundButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.minimumScaleFactor = 0.6f;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.imageView.clipsToBounds = NO;
        
        _needsUpdate = YES;
        
        _iconTintColor = [UIColor whiteColor];
        _iconTintColorHighlighted = [UIColor colorWithWhite:1 alpha:0.5f];
        
        _ellipseSize = CGSizeMake(38, 38);
        _ellipseLineWidth = [[UIScreen mainScreen] scale] > 1 ? 1 : 2;
        _ellipseFillColor = nil;
        _ellipseFillColorHighlighted = [UIColor whiteColor];
        _ellipseStrokeColor = [UIColor colorWithWhite:1 alpha:0.5f];
        _ellipseStrokeColorHighlighted = nil;
        
        _shadowOffset = CGSizeMake(0, 0);
        _shadowBlur = 5;
        _shadowColor = nil;
        
        _titlePosition = MRGRoundButtonTitlePositionBottom;
        _spaceBetweenImageAndTitle = 0;
    }
    return self;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)setIconName:(NSString *)iconName {
    if ([_iconName isEqualToString:iconName] == NO) {
        _iconName = [iconName copy];
        [self setNeedsUpdate];
    }
}

- (void)setIconFilePath:(NSString *)iconFilePath {
    if ([_iconFilePath isEqualToString:iconFilePath] == NO) {
        _iconFilePath = [iconFilePath copy];
        [self setNeedsUpdate];
    }
}

- (void)setSelectedIconName:(NSString *)selectedIconName {
    if ([_selectedIconName isEqualToString:selectedIconName] == NO) {
        _selectedIconName = [selectedIconName copy];
        [self setNeedsUpdate];
    }
}

- (void)setSelectedIconFilePath:(NSString *)selectedIconFilePath {
    if([_selectedIconFilePath isEqualToString:selectedIconFilePath] == NO) {
        _selectedIconFilePath = selectedIconFilePath;
        [self setNeedsUpdate];
    }
}

- (void)setIconTintColor:(UIColor *)iconTintColor {
    if (_iconTintColor != iconTintColor) {
        _iconTintColor = iconTintColor;
        [self setNeedsUpdate];
    }
}

- (void)setIconTintColorHighlighted:(UIColor *)iconTintColorHighlighted {
    if (_iconTintColorHighlighted != iconTintColorHighlighted) {
        _iconTintColorHighlighted = iconTintColorHighlighted;
        [self setNeedsUpdate];
    }
}

- (void)setEllipseSize:(CGSize)ellipseSize {
    if (CGSizeEqualToSize(_ellipseSize, ellipseSize) == NO) {
        _ellipseSize = ellipseSize;
        [self setNeedsUpdate];
    }
}

- (void)setEllipseLineWidth:(CGFloat)ellipseLineWidth {
    if (_ellipseLineWidth != ellipseLineWidth) {
        _ellipseLineWidth = ellipseLineWidth;
        [self setNeedsUpdate];
    }
}

- (void)setEllipseFillColor:(UIColor *)ellipseFillColor {
    if (_ellipseFillColor != ellipseFillColor) {
        _ellipseFillColor = ellipseFillColor;
        [self setNeedsUpdate];
    }
}

- (void)setEllipseFillColorHighlighted:(UIColor *)ellipseFillColorHighlighted {
    if (_ellipseFillColorHighlighted != ellipseFillColorHighlighted) {
        _ellipseFillColorHighlighted = ellipseFillColorHighlighted;
        [self setNeedsUpdate];
    }
}

- (void)setEllipseStrokeColor:(UIColor *)ellipseStrokeColor {
    if (_ellipseStrokeColor != ellipseStrokeColor) {
        _ellipseStrokeColor = ellipseStrokeColor;
        [self setNeedsUpdate];
    }
}

- (void)setEllipseStrokeColorHighlighted:(UIColor *)ellipseStrokeColorHighlighted {
    if (_ellipseStrokeColorHighlighted != ellipseStrokeColorHighlighted) {
        _ellipseStrokeColorHighlighted = ellipseStrokeColorHighlighted;
        [self setNeedsUpdate];
    }
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    if (CGSizeEqualToSize(_shadowOffset, shadowOffset) == NO) {
        _shadowOffset = shadowOffset;
        [self setNeedsUpdate];
    }
}

- (void)setShadowBlur:(CGFloat)shadowBlur {
    if (_shadowBlur != shadowBlur) {
        _shadowBlur = shadowBlur;
        [self setNeedsUpdate];
    }
}

- (void)setShadowColor:(UIColor *)shadowColor {
    if (_shadowColor != shadowColor) {
        _shadowColor = shadowColor;
        [self setNeedsUpdate];
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setNeedsUpdate];
}

- (void)setNeedsUpdate {
    self.needsUpdate = YES;
    [self setNeedsLayout];
}

- (void)updateIfNeeded {
    if (self.needsUpdate) {
        self.needsUpdate = NO;
        [self update];
    }
}

- (void)update {
    self.needsUpdate = NO;
    
    [self updateTitleLabel];
    
    UITraitCollection *traitCollection = nil;
    if ([self respondsToSelector:@selector(traitCollection)]) {
        traitCollection = self.traitCollection;
    }
    
    [super setImage:[self newImageWithIconFilePath:self.iconFilePath
                                        orIconName:self.iconName
                                     iconTintColor:self.iconTintColor
                                       ellipseSize:self.ellipseSize
                                  ellipseLineWidth:self.ellipseLineWidth
                                  ellipseFillColor:self.ellipseFillColor
                                ellipseStrokeColor:self.ellipseStrokeColor
                                      shadowOffset:self.shadowOffset
                                        shadowBlur:self.shadowBlur
                                       shadowColor:self.shadowColor
                                   traitCollection:traitCollection] forState:UIControlStateNormal];
    
    [super setImage:[self newImageWithIconFilePath:self.iconFilePath
                                        orIconName:self.iconName
                                     iconTintColor:self.iconTintColorHighlighted ?: self.iconTintColor
                                       ellipseSize:self.ellipseSize
                                  ellipseLineWidth:self.ellipseLineWidth
                                  ellipseFillColor:self.ellipseFillColorHighlighted ?: self.ellipseFillColor
                                ellipseStrokeColor:self.ellipseStrokeColorHighlighted ?: self.ellipseFillColorHighlighted ?: self.ellipseFillColor
                                      shadowOffset:self.shadowOffset
                                        shadowBlur:self.shadowBlur
                                       shadowColor:self.shadowColor
                                   traitCollection:traitCollection] forState:UIControlStateNormal|UIControlStateHighlighted];
    
    if (self.selectedIconFilePath != nil && [self.selectedIconFilePath isEqualToString:self.iconFilePath] == NO) {
        [super setImage:[self newImageWithIconFilePath:self.selectedIconFilePath
                                         iconTintColor:self.iconTintColor
                                           ellipseSize:self.ellipseSize
                                      ellipseLineWidth:self.ellipseLineWidth
                                      ellipseFillColor:self.ellipseFillColor
                                    ellipseStrokeColor:self.ellipseStrokeColor
                                          shadowOffset:self.shadowOffset
                                            shadowBlur:self.shadowBlur
                                           shadowColor:self.shadowColor
                                       traitCollection:traitCollection] forState:UIControlStateSelected];
        
        [super setImage:[self newImageWithIconFilePath:self.selectedIconFilePath
                                         iconTintColor:self.iconTintColorHighlighted ?: self.iconTintColor
                                           ellipseSize:self.ellipseSize
                                      ellipseLineWidth:self.ellipseLineWidth
                                      ellipseFillColor:self.ellipseFillColorHighlighted ?: self.ellipseFillColor
                                    ellipseStrokeColor:self.ellipseStrokeColorHighlighted ?: self.ellipseFillColorHighlighted ?: self.ellipseFillColor
                                          shadowOffset:self.shadowOffset
                                            shadowBlur:self.shadowBlur
                                           shadowColor:self.shadowColor
                                       traitCollection:traitCollection] forState:UIControlStateSelected|UIControlStateHighlighted];
        
    } else if (self.selectedIconName != nil && [self.selectedIconName isEqualToString:self.iconName] == NO) {
        [super setImage:[self newImageWithIconName:self.selectedIconName
                                     iconTintColor:self.iconTintColor
                                       ellipseSize:self.ellipseSize
                                  ellipseLineWidth:self.ellipseLineWidth
                                  ellipseFillColor:self.ellipseFillColor
                                ellipseStrokeColor:self.ellipseStrokeColor
                                      shadowOffset:self.shadowOffset
                                        shadowBlur:self.shadowBlur
                                       shadowColor:self.shadowColor
                                   traitCollection:traitCollection] forState:UIControlStateSelected];
        
        [super setImage:[self newImageWithIconName:self.selectedIconName
                                     iconTintColor:self.iconTintColorHighlighted ?: self.iconTintColor
                                       ellipseSize:self.ellipseSize
                                  ellipseLineWidth:self.ellipseLineWidth
                                  ellipseFillColor:self.ellipseFillColorHighlighted ?: self.ellipseFillColor
                                ellipseStrokeColor:self.ellipseStrokeColorHighlighted ?: self.ellipseFillColorHighlighted ?: self.ellipseFillColor
                                      shadowOffset:self.shadowOffset
                                        shadowBlur:self.shadowBlur
                                       shadowColor:self.shadowColor
                                   traitCollection:traitCollection] forState:UIControlStateSelected|UIControlStateHighlighted];
    } else {
        [super setImage:nil forState:UIControlStateSelected];
        [super setImage:nil forState:UIControlStateSelected|UIControlStateHighlighted];
    }
}

- (void)updateTitleLabel {
    switch (self.titlePosition) {
        case MRGRoundButtonTitlePositionBottom:
        case MRGRoundButtonTitlePositionMiddle:
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
            break;
    }
}

- (void)layoutSubviews {
    [self updateIfNeeded];
    [super layoutSubviews];
}

- (BOOL)mrg_hasTitle {
    return [[self titleForState:UIControlStateNormal] length] != 0;
}

- (CGRect)contentRectForBounds:(CGRect)bounds {
    CGRect contentRect = [super contentRectForBounds:bounds];
    return contentRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (![self mrg_hasTitle]) {
        return [super imageRectForContentRect:contentRect];
    }
    
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    switch (self.titlePosition) {
        case MRGRoundButtonTitlePositionBottom:
            imageRect = CGRectMake(floorf((CGRectGetWidth(contentRect) - CGRectGetWidth(imageRect)) * 0.5f), 0.0f, CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
            break;
        case MRGRoundButtonTitlePositionMiddle:
            imageRect = CGRectMake(floorf((CGRectGetWidth(contentRect) - CGRectGetWidth(imageRect)) * 0.5f),
                                   floorf((CGRectGetHeight(contentRect) - CGRectGetHeight(imageRect)) * 0.5f), CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
            break;
    }
    
    return imageRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (![self mrg_hasTitle]) {
        return [super titleRectForContentRect:contentRect];
    }
    
    CGFloat titleHeight = ceilf((self.titleLabel.numberOfLines > 0) ? (self.titleLabel.font.lineHeight * self.titleLabel.numberOfLines) : self.titleLabel.font.lineHeight);
    CGRect titleRect;
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    switch (self.titlePosition) {
        case MRGRoundButtonTitlePositionBottom:
            titleRect = CGRectMake(0, CGRectGetMaxY([self imageRectForContentRect:contentRect]) + self.spaceBetweenImageAndTitle, CGRectGetWidth(contentRect), titleHeight);
            break;
            
        case MRGRoundButtonTitlePositionMiddle:
            titleRect = CGRectMake(floorf((CGRectGetWidth(contentRect) - CGRectGetWidth(imageRect)) * 0.5f),
                                   floorf((CGRectGetHeight(contentRect) - CGRectGetHeight(imageRect)) * 0.5f), CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
            break;
    }
    
    return titleRect;
}

- (CGSize)sizeThatFits:(CGSize)size {
    
    [self updateIfNeeded];
    
    if ([[self titleForState:UIControlStateNormal] length] == 0) {
        return [super sizeThatFits:size];
    }
    
    size = [super sizeThatFits:size];
    size.height = CGRectGetMaxY([self titleRectForContentRect:[self contentRectForBounds:CGRectMake(0, 0, size.width, size.height)]]);
    return size;
}

#pragma mark - Image generation

+ (NSCache *)imageCache {
    static NSCache *imageCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageCache = [[NSCache alloc] init];
        imageCache.name = @"MRGRoundButton";
    });
    
    return imageCache;
}

- (UIImage *)newImageWithIconFilePath:(NSString *)iconFilePath
                           orIconName:(NSString *)iconName
                        iconTintColor:(UIColor *)iconTintColor
                          ellipseSize:(CGSize)ellipseSize
                     ellipseLineWidth:(CGFloat)ellipseLineWidth
                     ellipseFillColor:(UIColor *)ellipseFillColor
                   ellipseStrokeColor:(UIColor *)ellipseStrokeColor
                         shadowOffset:(CGSize)shadowOffset
                           shadowBlur:(CGFloat)shadowBlur
                          shadowColor:(UIColor *)shadowColor
                      traitCollection:(UITraitCollection *)traitCollection {
    
    if (iconFilePath.length != 0) {
        return [self newImageWithIconFilePath:iconFilePath
                                iconTintColor:iconTintColor
                                  ellipseSize:ellipseSize
                             ellipseLineWidth:ellipseLineWidth
                             ellipseFillColor:ellipseFillColor
                           ellipseStrokeColor:ellipseStrokeColor
                                 shadowOffset:shadowOffset
                                   shadowBlur:shadowBlur
                                  shadowColor:shadowColor
                              traitCollection:traitCollection];
    }
    
    return [self newImageWithIconName:iconName
                        iconTintColor:iconTintColor
                          ellipseSize:ellipseSize
                     ellipseLineWidth:ellipseLineWidth
                     ellipseFillColor:ellipseFillColor
                   ellipseStrokeColor:ellipseStrokeColor
                         shadowOffset:shadowOffset
                           shadowBlur:shadowBlur
                          shadowColor:shadowColor
                      traitCollection:traitCollection];
    
}


- (UIImage *)newImageWithIconName:(NSString *)iconName
                    iconTintColor:(UIColor *)iconTintColor
                      ellipseSize:(CGSize)ellipseSize
                 ellipseLineWidth:(CGFloat)ellipseLineWidth
                 ellipseFillColor:(UIColor *)ellipseFillColor
               ellipseStrokeColor:(UIColor *)ellipseStrokeColor
                     shadowOffset:(CGSize)shadowOffset
                       shadowBlur:(CGFloat)shadowBlur
                      shadowColor:(UIColor *)shadowColor
                  traitCollection:(UITraitCollection *)traitCollection {
    
    UIImage *icon = nil;
    
    if (iconName.length != 0) {
        icon = ((iconTintColor != nil) ? [UIImage imageNamedRetina:iconName tintColor:iconTintColor] : [UIImage imageNamedRetina:iconName]);
    }
    
    return [self newImageWithIcon:icon
                          iconKey:iconName
                    iconTintColor:iconTintColor
                      ellipseSize:ellipseSize
                 ellipseLineWidth:ellipseLineWidth
                 ellipseFillColor:ellipseFillColor
               ellipseStrokeColor:ellipseStrokeColor
                     shadowOffset:shadowOffset
                       shadowBlur:shadowBlur
                      shadowColor:shadowColor
                  traitCollection:traitCollection];
}

- (UIImage *)newImageWithIconFilePath:(NSString *)iconFilePath
                        iconTintColor:(UIColor *)iconTintColor
                          ellipseSize:(CGSize)ellipseSize
                     ellipseLineWidth:(CGFloat)ellipseLineWidth
                     ellipseFillColor:(UIColor *)ellipseFillColor
                   ellipseStrokeColor:(UIColor *)ellipseStrokeColor
                         shadowOffset:(CGSize)shadowOffset
                           shadowBlur:(CGFloat)shadowBlur
                          shadowColor:(UIColor *)shadowColor
                      traitCollection:(UITraitCollection *)traitCollection {
    
    UIImage *icon = nil;
    
    if (iconFilePath.length != 0) {
        icon = ((iconTintColor != nil) ? [UIImage imageFromFilePath:iconFilePath tintColor:iconTintColor] : [UIImage imageFromFilePath:iconFilePath]);
    }
    
    return [self newImageWithIcon:icon
                          iconKey:iconFilePath
                    iconTintColor:iconTintColor
                      ellipseSize:ellipseSize
                 ellipseLineWidth:ellipseLineWidth
                 ellipseFillColor:ellipseFillColor
               ellipseStrokeColor:ellipseStrokeColor
                     shadowOffset:shadowOffset
                       shadowBlur:shadowBlur
                      shadowColor:shadowColor
                  traitCollection:traitCollection];
}

- (UIImage *)newImageWithIcon:(UIImage *)icon
                      iconKey:(NSString *)iconKey
                iconTintColor:(UIColor *)iconTintColor
                  ellipseSize:(CGSize)ellipseSize
             ellipseLineWidth:(CGFloat)ellipseLineWidth
             ellipseFillColor:(UIColor *)ellipseFillColor
           ellipseStrokeColor:(UIColor *)ellipseStrokeColor
                 shadowOffset:(CGSize)shadowOffset
                   shadowBlur:(CGFloat)shadowBlur
                  shadowColor:(UIColor *)shadowColor
              traitCollection:(UITraitCollection *)traitCollection {
    id key = @[iconKey ?: [NSNull null], iconTintColor ?: [NSNull null], NSStringFromCGSize(ellipseSize), @(ellipseLineWidth), ellipseFillColor ?: [NSNull null], ellipseStrokeColor ?: [NSNull null], NSStringFromCGSize(shadowOffset), @(shadowBlur), shadowColor ?: [NSNull null], traitCollection ?: [NSNull null]];
    
    UIImage *image = [[[self class] imageCache] objectForKey:key];
    if (image != nil) {
        return image;
    }
    
    CGFloat padding = ((shadowColor != nil) ? shadowBlur : 0);
    CGSize imageSize = CGSizeMake(ellipseSize.width + (padding * 2), ellipseSize.width + (padding * 2));
    CGRect imageRect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    CGRect ellipseRect = CGRectMake((imageSize.width - (ellipseSize.width - ellipseLineWidth)) * 0.5f, (imageSize.height - (ellipseSize.height - ellipseLineWidth)) * 0.5f, (ellipseSize.width - ellipseLineWidth), (ellipseSize.height - ellipseLineWidth));
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    if (ellipseFillColor != nil) {
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), [ellipseFillColor CGColor]);
        CGContextFillEllipseInRect(UIGraphicsGetCurrentContext(), ellipseRect);
    }
    
    if (ellipseStrokeColor != nil) {
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), ellipseLineWidth);
        CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), [ellipseStrokeColor CGColor]);
        CGContextStrokeEllipseInRect(UIGraphicsGetCurrentContext(), ellipseRect);
    }
    
    if (icon) {
        if ([icon respondsToSelector:@selector(imageAsset)] && traitCollection != nil) {
            icon = [icon.imageAsset imageWithTraitCollection:traitCollection] ?: icon;
        }
        
        [icon drawAtPoint:CGPointMake((imageSize.width - icon.size.width) * 0.5f, (imageSize.height - icon.size.height) * 0.5f)];
    }
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    if (image != nil && shadowColor != nil) {
        BOOL maskShadow = (ellipseFillColor != nil);
        if (maskShadow) {
            // Draw clipped ellipse's shadow
            CGContextClearRect(UIGraphicsGetCurrentContext(), imageRect);
            CGContextSaveGState(UIGraphicsGetCurrentContext());
            CGContextBeginPath(UIGraphicsGetCurrentContext());
            CGContextAddRect(UIGraphicsGetCurrentContext(), imageRect);
            CGContextAddEllipseInRect(UIGraphicsGetCurrentContext(), ellipseRect);
            CGContextEOClip(UIGraphicsGetCurrentContext());
            CGContextSetShadowWithColor(UIGraphicsGetCurrentContext(), shadowOffset, shadowBlur, [shadowColor CGColor]);
            CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), [[UIColor whiteColor] CGColor]);
            CGContextFillEllipseInRect(UIGraphicsGetCurrentContext(), ellipseRect);
            CGContextRestoreGState(UIGraphicsGetCurrentContext());
            
        } else {
            // Clear image and set shadow
            CGContextClearRect(UIGraphicsGetCurrentContext(), imageRect);
            CGContextSetShadowWithColor(UIGraphicsGetCurrentContext(), shadowOffset, shadowBlur, [shadowColor CGColor]);
        }
        
        // Draw button image on top of shadow (or with shadow)
        [image drawAtPoint:CGPointMake(0, 0)];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        [[[self class] imageCache] setObject:image forKey:key];
    }
    
    return image;
}

@end
