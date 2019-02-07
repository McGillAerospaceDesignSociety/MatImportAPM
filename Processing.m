close all; clc;

log = who;

for i = 1:numel(log)
    log_str = char(log(i));
    var_str = erase(log_str, '_label');
    lbl_group.LineNo = 0;
    if contains(log_str,'label') && ~exist(var_str, 'var')
        clear(log_str); 
    else
        if contains(log_str, 'label')
            var = erase(log_str, '_label');
            temp_var = eval(var);
            [~, col] = size(temp_var);
            temp_lbl = eval(log_str);
            for j = 1:col
                lbl = char(temp_lbl(j,1));                
                lbl_group.(lbl) = temp_var(:,j);
            end
        end
        data.(var_str) = lbl_group;
        lbl_group = rmfield(lbl_group, fieldnames(lbl_group));
    end
end

save('APMdata.mat', 'data');

clear row col temp_var temp_lbl log log_str i j lbl var