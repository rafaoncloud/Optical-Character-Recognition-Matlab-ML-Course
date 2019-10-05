function T = generate_ordered_target(col)

T = zeros(10, col);
for i = 0 : col - 1
    T(mod(i, 10) + 1, i + 1) = 1;
end
    
end