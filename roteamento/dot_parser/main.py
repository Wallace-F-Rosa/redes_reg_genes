# Parse: file type dot to list

import pydot
import networkx as nx 

# setup path (global) origin and destiny
path_origin = "graph/loopback.dot"
path_destiny = "list/" + path_origin[5:-4] + ".txt"
DEBUG = False

# function: breadth-first search
def bfs(graph):
    # dictionary with the order 
    dict_breadth = {}

    # remove constant node e.g. '0.0'
    for n in list(graph.nodes()):
        if "." in n : 
            graph.remove_node(n)

    dict = {}
    # get the node inputs
    for n in graph.nodes():
        dict[n] = graph.in_degree(n)

    OPEN = []
    for n in dict.keys():
        if dict[n] == 0:
            OPEN.append(n)

    CLOSED = []

    count = 0
    while len(OPEN) > 0 :
        node = OPEN.pop()
        CLOSED.append(node)
        dict_breadth[node] = ""

        lista = []
        for no in list(graph.successors(node)):
            lista.append(no)
            if no not in OPEN and no not in CLOSED:
                OPEN.insert(0, no) 
        
        dict_breadth[node] = lista
        count += 1
    
    return dict_breadth 

# function: main
if __name__ == "__main__":

    # read the graph
    graph = nx.DiGraph(nx.drawing.nx_pydot.read_dot(path_origin))

    # Call the function bfs and return a dictionary 
    dict_breadth = bfs(graph)

    # debug
    if DEBUG :
        print(dict_breadth)

    # write the list in breadth
    arq = open(path_destiny, 'w')
    
    # print vertices
    arq.write(str(dict_breadth.__len__())+"\n")
    for i in dict_breadth :
        arq.write(i + " ") 
    arq.write("\n")

    # print edges
    ne = 0 #number os edges
    for i in dict_breadth :
        for j in dict_breadth[i] :
            ne = ne + 1
    arq.write(str(ne)+"\n")
    for i in dict_breadth :
        for j in dict_breadth[i] :
            arq.write(i + " " + j + "\n") 
    
    arq.close()
    print("done!")  
