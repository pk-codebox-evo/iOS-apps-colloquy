#import "CQPreferencesListEditViewController.h"

#import "CQPreferencesTextCell.h"

NS_ASSUME_NONNULL_BEGIN

@implementation CQPreferencesListEditViewController {
	id _listItem;
	NSString *_listItemPlaceholder;
	BOOL _viewDisappearing;
}

- (instancetype) init {
	return (self = [super initWithStyle:UITableViewStyleGrouped]);
}

#pragma mark -

- (void) viewWillAppear:(BOOL) animated {
	[super viewWillAppear:animated];

	[self.tableView reloadData];

	_viewDisappearing = NO;

	NSIndexPath *firstIndex = [NSIndexPath indexPathForRow:0 inSection:0];
	CQPreferencesTextCell *cell = (CQPreferencesTextCell *)[self.tableView cellForRowAtIndexPath:firstIndex];
	[cell.textField becomeFirstResponder];
}

- (void) viewWillDisappear:(BOOL) animated {
	_viewDisappearing = YES;

	[super viewWillDisappear:animated];
}

#pragma mark -

- (void) setListItem:(id) listItem {
	_listItem = listItem;

	[self.tableView reloadData];
}

- (void) setListItemPlaceholder:(NSString *) listItemPlaceholder {
	_listItemPlaceholder = [listItemPlaceholder copy];

	[self.tableView reloadData];
}

#pragma mark -

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
	return 1;
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
	CQPreferencesTextCell *cell = [CQPreferencesTextCell reusableTableViewCellInTableView:tableView];

	cell.textField.text = _listItem;
	cell.textField.placeholder = _listItemPlaceholder;
	cell.textField.clearButtonMode = UITextFieldViewModeAlways;
	cell.textField.returnKeyType = UIReturnKeyDefault;
	cell.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	cell.textField.autocorrectionType = UITextAutocorrectionTypeNo;
	cell.textEditAction = @selector(listItemChanged:);

	return cell;
}

- (NSIndexPath *__nullable) tableView:(UITableView *) tableView willSelectRowAtIndexPath:(NSIndexPath *) indexPath {
	return nil;
}

#pragma mark -

- (void) listItemChanged:(CQPreferencesTextCell *) sender {
	self.listItem = sender.textField.text;

	if (_viewDisappearing)
		return;

	[sender.textField becomeFirstResponder];
}
@end

NS_ASSUME_NONNULL_END
