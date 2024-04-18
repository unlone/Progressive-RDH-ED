function [shares, crt_shares] = SIS(Image, n_value, k_value, p_numbers, extra_secret)
    [L, W] = size(Image);
    Ps = zeros(L*W, 3); %initialization
    
    i=1; % polynominal row
    n=1; m=1; % image pixel counter
    
    % traverse the image
    while (n <= L)
        Ps(i,1) = randi(50);
        Ps(i,2) = extra_secret;
        Ps(i,3) = Image(n, m);
        m = m+1;
        
        if (m > W)
            m = 1;
            n = n+1;
        end
        i = i+1;
    end
    
    shares = ones(L, W, n_value).*250;
    crt_shares = ones(L, W, k_value, n_value).*250;
    
    for k = 1 : n_value
        i = 1;
        j = 1;
        counter = 1;
        
        while (i <= L)
            II = i;
            JJ = j;
            embedding = polyval(Ps(counter,:), k);
            shares(II, JJ, k) = embedding;
            for u = 1 : k_value
                crt_shares(II, JJ, u, k) = rem(embedding, p_numbers(u));
            end
            
            j = j + 1;
            if j > W
                j = 1;
                i = i +1;
            end
            
            counter=counter+1;
        end
        
    end
    
end