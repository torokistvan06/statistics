function [X,new_initial_value] = URNG2(initial_value,n)

if mod(initial_value,2) == 0
    initial_value = initial_value + 1;
end

m = 2^31-1;
a = 2^16 + 3;
c = 0;
[X,new_initial_value] = LinearCongruentialGenerator(m, a, c, initial_value, n);

end