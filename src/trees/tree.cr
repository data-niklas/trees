module Trees

    class Tree(T)
        property value : T | Nil
        getter children : Array(Tree(T))

        def initialize(@value : T | Nil = nil, @children = Array(Tree(T)).new)
        end

        def empty?
            @children.size == 0
        end

        # Direct number of children
        def children_count
            @children.size
        end

        # Number of all children recursively
        def count
            num = 1
            @children.each do |child|
                num += child.count
            end
            num
        end

        def set(index, new_child : Tree(T))
            @children[index] = new_child
        end

        def set(index, value : T)
            @children[index].value = value
        end

        def []=(index, new_child : Tree(T))
            set(index,new_child)
        end

        def [](index)
            get(index)
        end

        def get(index)
            @children[index]
        end

        def add(child : Tree(T))
            @children << child
        end

        def add(value : T)
            @children << Tree(T).new(value)
        end

        def delete(child : Tree(T))
            @children.delete child
        end

        def delete_at_index(index)
            @children.delete_at_index index
        end

        # position: if the value of the node will be before the children or after (default: before)
        def to_a(position : Bool = true)
            res = Array(T | Nil).new
            if position
                res << @value
            end
            @children.each do |child|
                res += child.to_a position
            end
            if !position
                res << @value
            end
            res
        end

    end

end