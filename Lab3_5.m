function Lab3_5 (n)
  a = 0;
  b = 0;
  for i=1:n
    ossz = 50;
    paradicsom = (ossz * 20)/100;
    uborka = (ossz * 16)/100;
    paprika = (ossz * 24)/100;
    hagyma = (ossz * 40)/100;
    pd = 0;
    ub = 0;
    pp = 0;
    hgy = 0;
    j = 1;
    while (j <= 20)
      px = paradicsom/ossz;
      ux = uborka/ossz;
      prx = paprika/ossz;
      hx = 1 - (px + ux + prx);
      X = [1 2 3 4; px ux prx hx];
      x = InversionByBinarySearch(X, 1, 1);
      ossz = ossz - 1;
      switch(x)
        case 1
          paradicsom = paradicsom - 1;
          pd = pd + 1;
        case 2
          uborka = uborka - 1;
          ub = ub + 1;
        case 3
          paprika = paprika - 1;
          pp = pp + 1;
        case 4
          hagyma = hagyma - 1;
          hgy = hgy + 1;
      end
      j = j + 1;
    end
    if ( pp ==5 && hgy == 8 && ub >= 1)
      a = a + 1;
    end

    ossz = 50;
    paradicsom = (ossz * 20)/100;
    uborka = (ossz * 16)/100;
    paprika = (ossz * 24)/100;
    hagyma = (ossz * 40)/100;
    pd = 0;
    ub = 0;
    pp = 0;
    hgy = 0;
    j = 1;
    while (j < 50)
      px = paradicsom/ossz;
      ux = uborka/ossz;
      prx = paprika/ossz;
      hx = 1 - (px + ux + prx);
      X = [1 2 3 4; px ux prx hx];
      x = InversionByBinarySearch(X, 1, 1);
      ossz = ossz - 1;
      switch(x)
        case 1
          paradicsom = paradicsom - 1;
          pd = pd + 1;
        case 2
          uborka = uborka - 1;
          ub = ub + 1;
        case 3
          paprika = paprika - 1;
          pp = pp + 1;
        case 4
          hagyma = hagyma - 1;
          hgy = hgy + 1;
      end

      if (pd == 7)
        b = b + j;
        break;
      end

      j = j + 1;

    end
  end

  disp(a/n);
  disp(b/n);

end
