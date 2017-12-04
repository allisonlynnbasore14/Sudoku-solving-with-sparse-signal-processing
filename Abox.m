function res = Abox(N)

    Inxn = eye(N);

    Jn = [];
    for i = 1:1:sqrt(N)
       Jn = [Jn, Inxn];
    end

    box1 = [];
    base = size(Jn,2);
    Oboxn = zeros(N, base);
    for i = 1:1:sqrt(N)
        if (i ~= sqrt(N))
            box1 = [box1, Jn, Oboxn];
        else
            box1 = [box1, Jn];
        end
    end
    rest = size(box1, 2);
    box1 = [box1, zeros(N,N^3-rest)];

    row = 4;

    boxRest = [];
    for row = 2:1:N
        boxTemp = [];
        boxTemp = [boxTemp, zeros(N,(row-1)*base)];
        for i = 1:1:sqrt(N)
            if (i ~= sqrt(N))
                boxTemp = [boxTemp, Jn, Oboxn];
            else
                boxTemp = [boxTemp, Jn];
            end
        end
        rest = size(boxTemp, 2);
        boxTemp = [boxTemp, zeros(N,N^3-rest)];
        boxRest = [boxRest; boxTemp];
    end

    res = [box1; boxRest];
    
end