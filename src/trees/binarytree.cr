require "./limitedtree.cr"

module Trees

    class EmptyTree(T) < Tree(T)
        def initialize
            initialize nil, [] of Tree(T)
        end
    end

    class BinaryTree(T) < LimitedTree(T)

        def initialize(@value : T | Nil = nil, @children = Array(Tree(T)).new(2,EmptyTree(T).new()))                
           #initialize(2, value, children)  
           @maxsize = 2
           if @maxsize != -1 && @children.size > @maxsize
                raise "The number of children must not exceed the maximum size of children"
            end
        end


        def add_sorted(value : T)
            if @value.nil?
                @value = value
            else
                if value < @value.as(T)
                    if has_left?
                        left!.add_sorted value
                    else
                        @children[0] = BinaryTree(T).new(value)
                    end
                else
                    if has_right?
                        right!.add_sorted value
                    else
                        @children[1] = BinaryTree(T).new(value)
                    end
                end
            end
        end

        def get(index) : Tree(T)
            @children[index]
        end

        def get!(index) : BinaryTree(T)
            @children[index].as(BinaryTree(T) | Tree(T)).as(BinaryTree(T))
        end

        def set(index, new_child : BinaryTree(T))
            @children[index] = new_child
        end

        def []=(index, new_child : BinaryTree(T))
            set(index,new_child)
        end

        def left=(new_child : BinaryTree(T))
            set(0, new_child)
        end

        def right=(new_child : BinaryTree(T))
            set(1, new_child)
        end

        def has_left?
            !left().is_a?(EmptyTree)
        end

        def has_right?
            !right().is_a?(EmptyTree)
        end

        def left
            get(0)
        end

        def right
            get(1)
        end

        def left!
            get!(0)
        end

        def right!
            get!(1)
        end

        def traverse(position : TraversalOrder)
            to_a position
        end

        def to_a(position : TraversalOrder)
            if position == TraversalOrder::In
                traverse_inorder()
            elsif position == TraversalOrder::Pre
                traverse_preorder()
            else
                traverse_postorder()
            end
        end

        def traverse_inorder()
            res = Array(T | Nil).new
            if has_left?()
                res += left!().traverse_inorder()
            end
            res << @value
            if has_right?()
                res += right!().traverse_inorder()
            end
            res
        end

        def traverse_preorder()
            res = Array(T | Nil).new
            res << @value
            if has_left?()
                res += left!().traverse_preorder()
            end
            if has_right?()
                res += right!().traverse_preorder()
            end
            res
        end

        def traverse_postorder()
            res = Array(T | Nil).new
            if has_left?()
                res += left!().traverse_postorder()
            end
            if has_right?()
                res += right!().traverse_postorder()
            end
            res << @value
            res
        end
    end

    enum TraversalOrder
        In
        Pre
        Post
    end


end