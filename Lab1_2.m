function Lab1_2()

% [0, 0.99] - kreta
% [1, 1.89] - ceruza
% [1.89, 3] - toll

i = 0;
a = 0;
b = 0;
test_count = 10000;
while(i < test_count)
    j = 0;
    kivalasztottKreta = 0;
    kivalasztottCeruza = 0;
    kivalasztottFilctoll = 0;
    total = 30;
    totalKreta = 10;
    totalCeruza = 9;
    totalToll = 11;
    kretaValszam = totalKreta / total;
    ceruzaValszam = kretaValszam + totalCeruza / total;
    tollValszam = 1;
    while(j < 16)
        p = URealRNG(1, 4, 0, 1, 1);
        if(p <= kretaValszam && p > 0)
           kivalasztottKreta = kivalasztottKreta + 1;
           totalKreta = totalKreta - 1;
        end
        
        if(p > kretaValszam && p <= ceruzaValszam)
           kivalasztottCeruza = kivalasztottCeruza + 1;
           totalCeruza = totalCeruza - 1;
        end
        
        if(p > ceruzaValszam && p <= tollValszam)
            kivalasztottFilctoll = kivalasztottFilctoll + 1;
            totalToll = totalToll - 1;
        end
        total = total - 1;
        kretaValszam = totalKreta / total;
        ceruzaValszam = kretaValszam + totalCeruza / total;
        tollValszam = 1;
        j = j + 1;
    end
    i = i + 1;
    if(kivalasztottKreta == 5 && kivalasztottFilctoll <= 7)
       a = a + 1; 
    end
    if(kivalasztottCeruza >= 3 && kivalasztottCeruza < 6)
       b = b + 1; 
    end
end
disp("A eredmeny:")
disp(a/test_count);
disp("B eredmeny:")
disp(b/test_count);
end