defmodule Lists do
    #take first element
    def tak([h1|t]) do h1 end

    #drop first element
    def drp([h1, h2|t]) do [h2|t] end

    #length of list
    def len([]) do 0 end
    def len([h|t]) do
        len(t) + 1
    end

    #summarize elements in list
    def sum([]) do 0 end
    def sum([h|t]) do 
    sum(t) + h
    end

    #duplicate elements in list
    def duplicate([]) do [] end
    def duplicate([h|t]) do
    [h, h | duplicate(t)]
    end

    #add to list
    def add(x,[]) do [x] end
    def add(x, [x|t]) do [x|t] end
    def add(x, [h|t]) do 
    [x|[h|t]]
    end

    #remove from list
    def remove(x, []) do [] end
    def remove(x, [x|t]) do remove(x, t) end
    def remove(x, [h|t]) do
    [h| remove(x,t)]
    end


    #add unique elements
    def unique([]) do [] end
    def unique([x|t]) do
    [x|unique(remove(x,t))]
    end

    #reverse list
    def reverse([]) do [] end
    def reverse([h|t]) do
    reverse(t) ++ h
    end

    #nth element
    def nth(0, [h| t]) do h end
    def nth(n, [h|t]) do
    nth(n-1, t)
    end

    #append to list
    def append([], y) do y end
    def append([h|t], y) do 
    z = append(t, y)
    [h | z]
    end

    #find element
    def find(key, []) do :nil end
    def find(key, [{key, value} | t]) do
    value
    end
    def find(key, [h | t]) do
    find(key, t)
    end



end
