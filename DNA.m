classdef DNA
	properties
        string
        nums
	end
    methods
        function obj = DNA(l)
            matchup = ['G', 'C', 'A', 'T'];
            obj.nums = zeros([1 l]);
            obj.string = '';
            for i = 1:l
                x = randi(4);
                obj.string = strcat(obj.string, matchup(x));
                obj.nums(i) = x;
            end
        end
        function t = transcribeDNA(d)
            t = '';
            matchup = ['C', 'G', 'U', 'A'];
            for i = 1:length(d.string)
                t = strcat(t, matchup(d.nums(i)));
            end
        end
        function c = crossDNA(x, y, p)
            a = length(x.nums);
            b = length(y.nums);
            if a == b
                c = DNA(a);
                for i = 1:p
                    c.nums(i) = x.nums(i);
                end
                for i = p+1:b
                    c.nums(i) = y.nums(i);
                end
                matchup = ['G', 'C', 'A', 'T'];
                c.string = '';
                for i = 1:a
                    c.string = strcat(c.string, matchup(c.nums(i)));
                end
            else
                c = DNA(1);
            end
        end
        function mutateDNA(d, chance)
            matchup = ['G', 'C', 'A', 'T'];
            for i = 1:length(d.nums)
                if rand() < chance
                    d.nums(i) = randi(4);
                    d.string(i) = matchup(d.nums(i));
                end
            end
        end
        function c = mixDNA(a, b)
            for i = 1:length(a.nums)
                if rand() < 0.5
                    c.nums(i) = a.nums(i);
                    c.string(i) = a.string(i);
                else
                    c.nums(i) = b.nums(i);
                    c.string(i) = b.string(i);
                end
            end 
        end
    end
end
