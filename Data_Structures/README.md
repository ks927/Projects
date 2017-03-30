# Data Structures

### Binary Search Tree

This is my implementation of a binary search tree. It is a data structure that utilizes nodes and a pointer to store data within memory. It takes in an array of numbers and parses it from its root (the first element) to the final element. It arranges the numbers so that each has up to two child nodes. Within my program there are three methods to search the tree. 

### Running

To use the data structure, first you must create an object of the BinarySearch class with 0 arguments. Next you pass in an array to the build_tree method. Now you can search through the array using any of three search methods available. Breadth first search uses a queue system, while depth first search uses a stack. Finally, the dfs_rec method searches like the depth first method, but does it recursively instead of with a stack.

Each method will return your value followed by its child nodes, if it has any, followed by their child nodes, and so on.

### Acknowledgments

This is my solution the Data Structures and Algorithms project provided by The Odin Project http://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms?ref=lc-pb
    


