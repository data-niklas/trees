# trees

Different types of trees exist:
- The abstract Tree, from which all trees inherit methods: AbstractTree
- The default type of tree is the Tree class
- SimpleTree is a more minimalistic kind of tree (similar to Tree) in terms of memory
- LimitedTree is limited to a number of children
- BinaryTree is a LimitedTree (limited to 2 children obviously)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     trees:
       github: data-niklas/trees
   ```

2. Run `shards install`

## Usage

```crystal
require "trees"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/data-niklas/trees/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Niklas Loeser](https://github.com/data-niklas) - creator and maintainer
