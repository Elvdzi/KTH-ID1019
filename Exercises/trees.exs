defmodule Binarytree do

    #check if element is in the tree
    def member(_, :nil) do :no end
    def member(e, {:leaf, e}) do :yes end
    def member(_, {:leaf, _}) do :no end
    def member(e, {:node, e, _, _}) do :yes end
    def member(e, {:node, v, left, _}) when e < v do
        member(e, left)
    end
    def member(e, {:node, _, _, right}) do
        member(e, right)
    end

    #insert element in tree
    def insert(e, :nil) do {:leaf, e} end
    def insert(e, {:leaf, v}) when e < v do
        {:node, v, insert(e, :nil), :nil}
    end
    def insert(e, {:leaf, v}) do
        {:node, v, :nil, insert(e, :nil)}
    end
    def insert(e, {:node, v, left, right}) when e < v do
        {:node, v, insert(e, left), right}
    end
    def insert(e, {:node, v, left, right}) do
        {:node, v, left, insert(e, right)}
    end

    #find biggest element (a part of delete)
    def biggest({:node, _, _, right}) do
        biggest(right)
    end
    def biggest({:leaf, v}) do
        v
    end

    #delete element in tree
    def delete(e, {:leaf, e}) do :nil end
    def delete(e, {:node, e, :nil, right}) do 
        {:node, v, vleft, vright} = right
        {:node, v, vleft, vright}
        end

    def delete(e, {:node, e, left, :nil}) do 
        {:node, v, vleft, vright} = left
         {:node, v, vleft, vright}
        end
   
    def delete(e, {node, e, left, right}) do
    {:node, biggest(left), delete(biggest(left), left), right}

    end
    def delete(e, {:node, v, left, right}) when e < v do
         {:node, v, delete(e, left), right}
    end
    def delete(e, {:node, v, left, right}) do
         {:node, v, left, delete(e, right)}
    end

    #lookup element in tree
    def lookup(_, :nil) do :no end
    def lookup(k, {:leaf, k, v}) do {:yes, v} end
    def lookup(k, {:node, k, v, :nil, :nil}) do {:yes, v} end
    def lookup(_, {:leaf, _, _}) do :no end
    def lookup(_, {:node, _, _, :nil, :nil}) do :no end
    def lookup(key, {:node, k, v, left, _}) when key < k do
        lookup(key, left)
    end
    def lookup(key, {:node, k, v, _, right}) do
        lookup(key, right)
    end

    #add element into tree
    def _add(:nil, key, value) do 
    {:node, key, value, :nil, :nil}
    end
    def _add({:node, key, _, left, right}, key, value) do
    {:node, key, value, left, right}
    end
    def _add({:node, rk, rv, left, right}, nk, nv) when nk < rk do
    {:node, rk, rv, _add(left, nk, nv), right}
    end
    def _add({:node, rk, rv, left, right}, nk, nv) do
    {:node, rk, rv, left, _add(left, nk, nv)} 
    end

    # depth of the leaf with specific key
    def depth(_, :nil) do :no end
    def depth(k, {:node, k, _, _}) do {:ok, 1} end
    def depth(key, {:node, k, left, right}) when key < k do
        case depth(key, left) do
        {:ok, d} -> {:ok, d+1} 
        :no -> :no
        end
    end
    def depth(key, {:node, k, left, right}) do
        case depth(key, right) do
        {:ok, d} -> {:ok, d+1}
        :no -> :no
        end
    end

    #maximum depth
    def max(:nil) do 0 end
    def max({:node, _, left, right}) do
        max(max(left), max(right)) + 1 #+1 pga rot
    end

    #size of tree
    def size(:nil) do 0 end
    def size({:node, _, left, right}) do
    size(left) + size(right) + 1
    end

    #converts tree to a list
    def treeTolist(:nil, list) do list end      #kommer ner till slutet
    def treeTolist({:node, val, left, right}, list) do
        list = treeTolist(right, list)
        list = [val|list]
        list = treeTolist(left, list)
    end

    def treeTolist2(:nil, list) do list end
    def treeTolist2({:node, val, left, right}, list) do
        list1 = treeTolist2(left, list)
        list2 = treeTolist2(right, list)
        list2 = [val|list2]
        list1++list2
    end

    #nth leaf
    def nth(n, {:node, left, right}) do
        case nth(n, left) do
        {:found, val} -> {:found, val}
        {:cont, val} -> nth(n, right)
        end
    end
    def nth(n, {:leaf, val}) do
        case n-1 do
        1 -> {:found, val}
        k -> {:cont, k}
        end
    end
    

end

