## Learning Outcomes
* Identify path coverage testing and creation of control-flow graphs.
* Discuss dataflow testing.
* Discuss mutation testing and identify its drawbacks.

## Path Testing
* Design test cases such that:
  * All linearly independent paths in the program are executed at least once
* Defined in terms of Control Flow Graph (CFG) of a program

### Path Coverage-Based Testing
* To understand the path coverage-based testing:
  * We need to learn how to draw the Control Flow Graph (CFG) of a program
* A CFG describes:
  * The sequence in which different instructions of a program get executed
  * The way control flows through the program

### How to draw a Control Flow Graph
1. Number all statements in the program.
   * Each statement or block of code is assigned a unique number.
2. Use the numbered statements as nodes in the graph.
3. Draw an edge (arrow) from one node to another if:
   * Execution of the statement represented by the first node can lead to the execution of the statement represented by the second node.
4. Include decision points (like if, while, for, switch) with outgoing edges representing possible control flow paths.

**Summary**: Nodes = statements, edges = flow of control. The graph visually represents all possible paths through the code during execution.

* Every program is composed of three basic control structures:
  1. **Sequence** — code that runs line by line in order.
  2. **Selection** — decision-making, like if or switch statements.
  3. **Iteration** — loops, like for, while, or do-while.
* If you understand how to draw Control Flow Graphs (CFG) for these basic structures,
you can draw a CFG for any program by combining these patterns.

### Control Flow Graph (CFG)
* A Control Flow Graph (CFG) is the graphical representation of control flow or computation during the execution of programs or applications. Control flow graphs are mostly used in static analysis as well as compiler applications, as they can accurately represent the flow inside a program unit.
**Example**
```
if  A = 10 then
  if B > C
     A = B
  else A = C
  endif
  endif
print A, B, C 

```
Flowchart of above example will be:
![control-flow-graph-example.png](assets/control-flow-graph-example.png)

Control Flow Graph of above example will be:
![cfg_example.png](assets/cfg_example.png)

### Paths
- A **path** in a Control Flow Graph (CFG) is any possible route you can take through the program from the starting node to the ending node.
- It consists of a sequence of connected nodes and edges that represent the order in which statements are executed.

### Linearly Independent Paths
- **Linearly Independent Paths** are unique paths through the CFG that introduce at least **one new edge** or **node** that is not included in any other path.
- They are important for testing because covering all linearly independent paths ensures that all parts of the program logic are exercised at least once.
- The **Cyclomatic Complexity** of a program gives the number of linearly independent paths.

#### Example:
If a CFG has 4 linearly independent paths, designing test cases to follow each of these paths will help achieve thorough coverage of the program logic.

####  Why It Matters
- Identifying linearly independent paths helps in designing more effective test cases.
- This reduces the risk of missing defects caused by untested logic branches.

#### Example of Control Flow Graph (CFG) and Linearly Independent Paths

#### Code Example
```
1. Start
2. if (A > 0)
3.     doSomething();  
4. else
5.     doSomethingElse();  
6. end
```
#### Control Flow Graph (CFG) Explanation
- Each numbered statement is represented as a node in the graph.
- The flow of control is as follows:
  - From **1 → 2**
  - If the condition is **true**: **2 → 3 → 6**
  - If the condition is **false**: **2 → 5 → 6**

#### Linearly Independent Paths Defined
- **Path 1**: 1 → 2 → 3 → 6 (condition true)
- **Path 2**: 1 → 2 → 5 → 6 (condition false)

#### Summary
- There are **2 linearly independent paths**.
- This matches the **cyclomatic complexity** of 2, calculated as:
  Cyclomatic Complexity = Number of Decisions + 1 = 1 + 1 = 2
- Designing test cases to follow each linearly independent path ensures both outcomes of the `if` condition are tested.

#### Why This Matters
- Covering all linearly independent paths helps to test all important branches of the program.
- This approach increases confidence that the logic is working correctly.

### McCabes Cyclomatic Metric
McCabe’s Cyclomatic Complexity is a software metric used to measure the **complexity of a program** by counting the number of **linearly independent paths** through its Control Flow Graph (CFG).

Cyclomatic Complexity (CC) = $E - N + 2P$

Where:
- $E$ = Number of edges (arrows in the CFG)
- $N$ = Number of nodes (statements or blocks)
- $P$ = Number of connected components (usually 1 for a single program or function)

It provides a practical way of determining the maximum number of test cases required for basic path testing

If you are analyzing just **one function** or a simple program (P = 1), the formula becomes:

CC = $E - N + 2$

Where:
- $E$ = Number of edges (arrows in the CFG)
- $N$ = Number of nodes (statements or blocks)

## Dataflow and Mutation Testing

## Mutation Testing

## Lesson Summary 