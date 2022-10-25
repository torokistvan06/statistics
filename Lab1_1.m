function Lab1_1()
    i = 0;
    a = 0;
    b = 0;
    test_count = 10000;
    while (i < test_count)
        x=URealRNG(1,4,-5,5,1);
        y=URealRNG(2,4,-4,4,1);
        tavolsag = sqrt((-3 - x)^2 + (0 - y)^2) + sqrt((3 - x)^2 + (0 - y)^2);
        if (tavolsag < 10)
            plot(x,y,'g.');
            hold on;
            if (y-0.6*x+3 >0 && y+x+3 >0 && y-0.5*x-1.5 < 0 && y+1.5*x - 7.5 < 0) && (x > y)
                a = a + 1;
                plot(x,y,'r.');
                hold on;
            end

            if ((y+x+3 < 0 || y-x-3 > 0 || y+x-3 > 0 || y-x+3 < 0) && (isInCircle(-3,0,2,x,y) || isInCircle(3,0,2,x,y)))
                b = b + 1;
                plot(x,y,'b.');
                hold on;
            end

            if ((y+x+3 < 0 || y-x-3 > 0 || y+x-3 > 0 || y-x+3 < 0) && (isInCircle(-3,0,2,x,y) || isInCircle(3,0,2,x,y)) && ((y-0.6*x+3 >0 && y+x+3 >0 && y-0.5*x-1.5 < 0 && y+1.5*x - 7.5 < 0) && (x > y)))
                plot(x,y,'m.');
                hold on;
            end
        else
            i = i - 1;
        end
        i = i + 1;
    end

    disp('A alpont eredmenye: ')
    disp(a/test_count)
    disp('B alpont eredmenye: ')
    disp(b/test_count)
end