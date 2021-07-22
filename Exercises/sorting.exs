defmodule Sorting do 

def insert(element, []) do [element] end
#if element is bigger than head
def insert(element, [h|t]) when element > h do
[h | insert(element, t)]
end

#if element is smaller than head
def insert(element, [h|t]) when element < h do
[element | [h|t]]
end


#insertion sort
def isort([], sorted) do sorted end
def isort([h|t], sorted) do
    isort(t, insert(h, sorted))
end


end