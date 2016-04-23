//
//  TestTableViewCell.m
//  EstimateCellHeight
//
//  Created by Mag1cPanda on 16/4/20.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "TestTableViewCell.h"
#import "PureLayout.h"
#define kLabelHorizontalInsets      15.0f
#define kLabelVerticalInsets        10.0f

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lab1.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
    
    self.lab2.lineBreakMode = NSLineBreakByTruncatingTail;
    self.lab2.numberOfLines = 0;
    self.lab2.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    
    [self updateFonts];
}

-(void)updateConstraints{
    if (!self.didSetupConstraints) {
        
//        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
//            [self.lab1 autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
//        }];
//        [self.lab1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
//        [self.lab1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
//        [self.lab1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
//        
//        [self.lab2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lab1 withOffset:10 relation:NSLayoutRelationGreaterThanOrEqual];
//        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
//            [self.lab2 autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
//        }];
//        [self.lab2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
//        [self.lab2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
//        [self.lab2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
        
        
        //----------------------------------------------------------------
        
        
//        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
//            [self.lab1 autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
//        }];
//        [self.lab1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLabelVerticalInsets];
//        [self.lab1 autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
//        [self.lab1 autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
//        
//        
//        [self.lab2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lab1 withOffset:kLabelVerticalInsets relation:NSLayoutRelationGreaterThanOrEqual];
//        
//        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
//            [self.lab2 autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
//        }];
//        [self.lab2 autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
//        [self.lab2 autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
//        [self.lab2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kLabelVerticalInsets];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.lab2.preferredMaxLayoutWidth = CGRectGetWidth(self.lab2.frame);
}

- (void)updateFonts
{
    self.lab1.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.lab2.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
