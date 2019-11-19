function plotT2Map(T2Map,masks)
removeMiddleMask = false(64,64);
for i = 1:5
    if i == 3
        continue
    end
    removeMiddleMask = removeMiddleMask + masks(:,:,i);
end
figure();
imagesc(T2Map.*removeMiddleMask);
colorbar();
title('T2-values by exponential fit (middle tube filtered out)');
end

