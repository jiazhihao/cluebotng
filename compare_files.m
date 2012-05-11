args = argv();

if length(args) < 4
  disp('usage: name1 filepath1 name2 filepath2')
  exit(1)
end

string1 = args{1};
file1 = args{2};
string2 = args{3};
file2 = args{4};

table1 = dlmread(file1);
table2 = dlmread(file2);

[auc1, auc2] = roc_compare(string1, table1(:,3), table1(:,2), string2, table2(:,3), \
	    table2(:,2));
name = [string1, string2, '.png'];
print(name, '-dpng')
disp(['output saved in: ', name])