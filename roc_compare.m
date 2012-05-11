function auc1, auc2 = roc_compare(string1, false_pos1, true_pos1, \
				 string2, false_pos2, true_pos2)
  %%% string1 is the title for technique 1
  %%% string2 the one for technique 2
  %%% false_pos1 is the column  for false positive scores
  %%% false_pos2 is the corresponding column of true positives

  [auc1, xs1, ys1] = prepare(false_pos1, true_pos1);
  plot(xs1, ys1, 'r');

  l1 = sprintf("%s. auc: %f", string1, auc1);
  legend(l1);
  [auc2, xs2, ys2] = prepare(false_pos2, true_pos2);


  hold on;
  plot(xs2, ys2, 'b');
  l2 = sprintf("%s. auc: %f", string2, auc2);
  legend(l2);

  title(['ROC comparison: ', string1, ' vs. ', string2], 'fontsize', 20)
  xlabel('false postive fraction', 'fontsize', 18);
  ylabel('true positive fraction', 'fontsize', 18);
    
  hold off;
end

function auc, xs,ys = prepare(false_pos, true_pos)
  data = [false_pos, true_pos];
  sortedbyx = sortrows(data,1);

  deltas = sortedbyx(2:end,1) - sortedbyx(1:end-1,1);
  ys = sortedbyx(2:end,2);

  auc = sum(deltas.*ys);

  auc = trapz(sortedbyx(:,1), sortedbyx(:,2));

  xs = sortedbyx(:,1);
  ys = sortedbyx(:,2);
end