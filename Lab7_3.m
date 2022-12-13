function Lab7_3(n)

a = 0;
b = 0;

for i = 1:n
    ossz_repulo = 200;
    ossz_vonat = 500;

    k_vonat_dania = 0;
    k_repulo_dania = 0;

    vonat_anglia = (ossz_vonat * 12) / 100;
    vonat_portugalia = (ossz_vonat * 22) / 100;
    vonat_lengyelorszag = (ossz_vonat * 28) / 100;
    vonat_dania = (ossz_vonat - vonat_anglia - vonat_portugalia - vonat_lengyelorszag);

    repulo_anglia = (ossz_repulo * 34) / 100;
    repulo_portugalia = (ossz_repulo * 18) / 100;
    repulo_lengyelorszag = (ossz_repulo * 20) / 100;
    repulo_dania = (ossz_repulo - repulo_anglia - repulo_portugalia - repulo_lengyelorszag);

    j = 1;
    while(true)

    p_vonat_anglia = vonat_anglia / ossz_vonat;
    p_vonat_portugalia = vonat_portugalia / ossz_vonat;
    p_vonat_lengyelorszag = vonat_lengyelorszag / ossz_vonat ;
    p_vonat_dania = (1 - (p_vonat_anglia + p_vonat_portugalia + p_vonat_lengyelorszag));

    p_repulo_anglia = (repulo_anglia / ossz_repulo);
    p_repulo_portugalia = (repulo_portugalia / ossz_repulo);
    p_repulo_lengyelorszag = (repulo_lengyelorszag / ossz_repulo);
    p_repulo_dania = (1 - (p_repulo_anglia + p_repulo_portugalia + p_repulo_lengyelorszag));
    
    u = ULEcuyerRNG(1);
    if(u > 0.33)
       X = [1 2 3 4 ; p_vonat_anglia p_vonat_portugalia p_vonat_lengyelorszag p_vonat_dania];
       x = InversionByBinarySearch(X, 1, 1);
       switch(x)
           case 1
               vonat_anglia = vonat_anglia - 1;
           case 2
               vonat_portugalia = vonat_portugalia - 1;
           case 3
               vonat_lengyelorszag = vonat_lengyelorszag - 1;
           case 4
               vonat_dania = vonat_dania - 1;
               k_vonat_dania = k_vonat_dania + 1;
       end
       ossz_vonat = ossz_vonat - 1;
    else
       X = [1 2 3 4 ; p_repulo_anglia p_repulo_portugalia p_repulo_lengyelorszag p_repulo_dania];
       x = InversionByBinarySearch(X, 1, 1);
       switch(x)
           case 1
               repulo_anglia = repulo_anglia - 1;
           case 2
               repulo_portugalia = repulo_portugalia - 1;
           case 3
               repulo_lengyelorszag = repulo_lengyelorszag - 1;
           case 4
               repulo_dania = repulo_dania - 1;
               k_repulo_dania = k_repulo_dania + 1;
       end
       ossz_repulo = ossz_repulo - 1;
    end
    if((k_repulo_dania + k_vonat_dania) == 10)
        a = a + j;
        break;
    end
    j = j + 1;
    end
    
    ossz_repulo = 200;
    ossz_vonat = 500;

    k_vonat_anglia = 0;
    k_vonat_lengyelorszag = 0;

    k_repulo_anglia = 0;
    k_repulo_lengyelorszag = 0;

    vonat_anglia = (ossz_vonat * 12) / 100;
    vonat_portugalia = (ossz_vonat * 22) / 100;
    vonat_lengyelorszag = (ossz_vonat * 28) / 100;
    vonat_dania = (ossz_vonat - vonat_anglia - vonat_portugalia - vonat_lengyelorszag);

    repulo_anglia = (ossz_repulo * 34) / 100;
    repulo_portugalia = (ossz_repulo * 18) / 100;
    repulo_lengyelorszag = (ossz_repulo * 20) / 100;
    repulo_dania = (ossz_repulo - repulo_anglia - repulo_portugalia - repulo_lengyelorszag);
    j = 1;
    while(j<=50)

    p_vonat_anglia = vonat_anglia / ossz_vonat;
    p_vonat_portugalia = vonat_portugalia / ossz_vonat;
    p_vonat_lengyelorszag = vonat_lengyelorszag / ossz_vonat ;
    p_vonat_dania = (1 - (p_vonat_anglia + p_vonat_portugalia + p_vonat_lengyelorszag));

    p_repulo_anglia = (repulo_anglia / ossz_repulo);
    p_repulo_portugalia = (repulo_portugalia / ossz_repulo);
    p_repulo_lengyelorszag = (repulo_lengyelorszag / ossz_repulo);
    p_repulo_dania = (1 - (p_repulo_anglia + p_repulo_portugalia + p_repulo_lengyelorszag));
    
    u = ULEcuyerRNG(1);
    if(u > 0.33)
       X = [1 2 3 4 ; p_vonat_anglia p_vonat_portugalia p_vonat_lengyelorszag p_vonat_dania];
       x = InversionByBinarySearch(X, 1, 1);
       switch(x)
           case 1
               vonat_anglia = vonat_anglia - 1;
               k_vonat_anglia = k_vonat_anglia + 1;
           case 2
               vonat_portugalia = vonat_portugalia - 1;
           case 3
               vonat_lengyelorszag = vonat_lengyelorszag - 1;
               k_vonat_lengyelorszag = k_vonat_lengyelorszag + 1;
           case 4
               vonat_dania = vonat_dania - 1;
       end
       ossz_vonat = ossz_vonat - 1;
    else
       X = [1 2 3 4 ; p_repulo_anglia p_repulo_portugalia p_repulo_lengyelorszag p_repulo_dania];
       x = InversionByBinarySearch(X, 1, 1);
       switch(x)
           case 1
               repulo_anglia = repulo_anglia - 1;
               k_repulo_anglia = k_repulo_anglia + 1;
           case 2
               repulo_portugalia = repulo_portugalia - 1;
           case 3
               repulo_lengyelorszag = repulo_lengyelorszag - 1;
               k_repulo_lengyelorszag = k_repulo_lengyelorszag + 1;
           case 4
               repulo_dania = repulo_dania - 1;
       end
       ossz_repulo = ossz_repulo - 1;
    end
    j = j + 1;
    end
    b = b + k_vonat_anglia + k_repulo_anglia + k_vonat_lengyelorszag + k_repulo_lengyelorszag;
end

disp(a / n);
disp(b / n);
end


