%calculate average T2 for each vial/mask
function T2List = calculateAverageT2(T2Map,masks)
    masksSize = size(masks);
    T2List = zeros(1,masksSize(3));
    for i = 1:length(T2List)
        n = sum(sum(masks(:,:,i)));
        T2List(i) = sum(sum(T2Map.*(masks(:,:,i))))/n;
    end
    
end