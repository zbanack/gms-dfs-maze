///checkNeighbors();

/*
    @author Zack Banack
    https://github.com/zbanack
    
    This script is called by a cell to get reference to its
    neighboring cells and whether or not they have been visited.
    If possible, it will return a random unvisited, neighboring cell.
*/

var neighbors, n; // declare temp vars
neighbors = ds_list_create(); // create a list to hold the cell's neighbors
n[0] = index(i, j - 1); // get the neighbor above us
n[1] = index(i + 1, j); // get the neighbor to the right of us
n[2] = index(i, j + 1); // get the neighbor below us
n[3] = index(i - 1, j); // get the neighbor to the left of us

/* if there is a neighbor, n, and it has not been visited, add
it to the list of avaliable neighbors. Repeat for right, left, above, below*/
for (var c = 0; c < array_length_1d(n); c++) {
    if (n[c] != undefined) {
        if (!n[c].visited) {
            ds_list_add(neighbors, n[c]);
        }
    }
}

// check if we added any neighbors to our list (it's not empty)
if (!ds_list_empty(neighbors)) {
    ds_list_shuffle(neighbors); // shuffle the list of neighbors
    var n = ds_list_find_value(neighbors, 0); // grab the top neighbor
    ds_list_destroy(neighbors); // destroy the list of neighbors
    return n; // return the randomly-selected neighbor
} else {
    ds_list_destroy(neighbors); // destroy the list of neighbors
    return undefined; // return undefined, we have no neighbors
}
