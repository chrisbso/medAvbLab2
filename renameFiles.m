strOrg = 'C:\Users\omgwt\OneDrive\Documents\MedAvb\MW_Kurs2019_T2_MW_Kurs2019_T2_MW_Kurs2019_T2__E1_P1\EnIm1.dcm';
strDest = 'C:\Users\omgwt\OneDrive\Documents\MedAvb\MW_Kurs2019_T2_MW_Kurs2019_T2_MW_Kurs2019_T2__E1_P1\E1.dcm';

for i = 1:9
    strOrg(89) = num2str(i);
    strDest(95) = num2str(i);
    strDest(89) = num2str(i);
movefile(strOrg,strDest);
end