lm_list = feature('lmfeaturelist')
for i=1:numel(lm_list)
    if license('checkout',lm_list{i}) == 1
        disp(['License for Toolbox : ',lm_list{i}, ' is available '])
    else
        disp(['License for Toolbox : ',lm_list{i}, ' is not available '])
    end
end
