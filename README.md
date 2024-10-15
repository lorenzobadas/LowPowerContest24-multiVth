# **multiVth** - Low-Power Contest 2023-2024

## Description
`multiVth` is a TCL procedure designed to optimize the threshold voltage (VT) of cells in a combinational circuit to minimize post-synthesis leakage power.
Three constraint have to be met:
1. The worst slack must be positive.
2. Logic gates must keep the same cell footprint.
3. The runtime must be lower than three minutes.

## Synopsis
```tcl
multiVth
```

## Technical Details
`multiVth` performs an optimization in three phases, guided by a priority list based on timing slack:
1. **Coarse-grain optimization**
2. **Fine-grain optimization**
3. **Refinement**

During these phases, two algorithms are used to swap cells:
- **Binary search swapping algorithm** (Phase 1)
- **Linear windowed swapping algorithm** (Phases 2 and 3)

### Binary Search Swapping Algorithm
1. Create a priority list of cells in the original VT group.
2. Set the initial percentage of cells to be swapped to 50%.
3. Try to swap the cells to the target VT group.
4. Check if the timing constraint is met.
   - If met, update the priority list.
   - Else, revert the changes.
5. Halve the percentage of cells to be swapped and repeat from step 3 until there are no more cells to swap.

### Linear Windowed Swapping Algorithm
1. Create a priority list of cells in the original VT group.
2. Swap cells within the swapping window defined by the step parameter.
3. Check if the timing constraint is met.
   - If met, update the priority list, reset the failure count, and reset the swapping window.
   - Else, revert changes, increment the failure count, and shift the swapping window by half the step.
4. Repeat from step 2 until the swapping window reaches the end of the priority list or the failure count exceeds a predetermined exit threshold.

In phase 1, the binary search algorithm performs swaps from low threshold voltage (L-Vt) to standard (S-Vt), and then from S-Vt to high threshold voltage (H-Vt). 

In phase 2, the linear windowed algorithm is used four times with logarithmically decreasing steps for swaps from L-Vt to S-Vt, and four times with a fixed step for swaps from S-Vt to H-Vt.

Phase 3 executes only if the execution time constraint is respected, performing swaps with steps of two and one, both from L-Vt to S-Vt and S-Vt to H-Vt.

## Evaluation
The command was tested on two benchmark circuits, `c1908` and `c5315`.
For both these circuits, the reference leakage power was measured after synthesizing the design with only L-Vt cells, with a clock period of 2 ns, 1.5 ns, and 1 ns.
The leakage power was then measured after running the `multiVth` command on the design, with the same clock periods.
The following thresholds where provided in order to evaluate the command.

| Benchmark | Clock Period (ns) | Leakage Power Savings |
|-----------|-------------------|-----------------------|
| c1908     | 2.0               | >50%                  |
| c1908     | 2.0               | >75%                  |
| c1908     | 2.0               | >85%                  |
| c1908     | 1.5               | >45%                  |
| c1908     | 1.5               | >55%                  |
| c1908     | 1.0               | >10%                  |
| c1908     | 1.0               | >15%                  |
| c5315     | 2.0               | >50%                  |
| c5315     | 2.0               | >85%                  |
| c5315     | 2.0               | >90%                  |
| c5315     | 1.5               | >65%                  |
| c5315     | 1.5               | >70%                  |
| c5315     | 1.0               | >20%                  |
| c5315     | 1.0               | >25%                  |

## Results
| Benchmark | Clock Period (ns) | Leakage Power Savings |
|-----------|-------------------|-----------------------|
| c1908     | 2.0               | 95.40%                |
| c1908     | 1.5               | 66.24%                |
| c1908     | 1.0               | 15.98%                |
| c5315     | 2.0               | 96.40%                |
| c5315     | 1.5               | 72.01%                |
| c5315     | 1.0               | 25.32%                |

The table above shows the obtained results.
The command was able to meet the requirements for all the test cases, obtaining full marks.

> **_NOTE:_** 
For confidentiality reasons, the scripts used to run the command are not provided in this repository.
The result files were obtained by running the developed Makefile.