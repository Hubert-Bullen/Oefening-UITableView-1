//
//  MatchTableViewCell.h
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Match.h"

@interface MatchTableViewCell : UITableViewCell

- (void) createCells:(Match *)match;

@end
