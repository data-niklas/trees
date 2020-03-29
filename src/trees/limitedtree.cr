require "./tree.cr"

module Trees

    class LimitedTree(T) < Tree(T)

        getter maxsize : Int32
        def initialize(@maxsize = -1 , @value : T | Nil = nil, @children = [] of Tree(T))
            if @maxsize != -1 && @children.size > @maxsize
                raise "The number of children must not exceed the maximum size of children"
            end
        end

        def add(child : LimitedTree(T)) : Bool
            if @maxsize != -1 && @children.size == @maxsize
                false
            else    
                @children << child
                true
            end
        end

        def add(value : T) : Bool
            if @maxsize != -1 && @children.size == @maxsize
                false
            else    
                @children << LimitedTree(T).new(@maxsize, value)
                true
            end
        end

        def get(index) : LimitedTree(T)
            @children[index].as(Tree(T) | LimitedTree(T)).as(LimitedTree(T))
        end

        def set(index, new_child : LimitedTree(T))
            @children[index] = new_child
        end

        def []=(index, new_child : LimitedTree(T))
            set(index,new_child)
        end

    end
end