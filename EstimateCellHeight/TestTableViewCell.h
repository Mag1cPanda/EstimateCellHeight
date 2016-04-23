//
//  TestTableViewCell.h
//  EstimateCellHeight
//
//  Created by Mag1cPanda on 16/4/20.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (nonatomic, assign) BOOL didSetupConstraints;

- (void)updateFonts;
@end
