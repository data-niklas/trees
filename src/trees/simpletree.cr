require "./tree"

module Trees
    # Similar to the Tree class, but more minimalistic
    class SimpleTree(T) < AbstractTree(T)
        property value : T | Nil
        getter children : Array(SimpleTree(T) | T | Nil)
        def initialize(@value = nil, @children = [] of SimpleTree(T) | T | Nil)
        end

        def empty? : Bool
            @children.size == 0
        end

        def set(index, value : T | Nil | SimpleTree(T))
            @children[index] = value
        end

        def get(index)
            @children[index]
        end

        def delete(index)
            @children.delete_at_index(index)
        end

        def add(value : T | Nil | SimpleTree(T))
            @children << value
        end

        def add(index, value : T | Nil | SimpleTree(T))
            @children.insert index, value
        end

        def is_node(index)
            @children[index].is_a?(SimpleTree(T))
        end

        def count
            num = 1
            @children.each do |child|
                if child.is_a?(SimpleTree(T))
                    num += child.count
                else
                    num += 1
                end
            end
            num
        end

        def children_count
            @children.size
        end
    end
end