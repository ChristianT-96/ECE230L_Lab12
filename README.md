# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Christian Trevino
Brandon Chacon 
## Summary
In this lab we used D flips to create a binary encoded and a one-hot finite state machine.
## Lab Questions

### Compare and contrast One Hot and Binary encodings
One Hot encoding requires only a single bit in a certain digit to be high to point to a certain state, whereas 
binary encoding realies on numbering each state using binary values and each binary value points
to a single state.
### Which method did your team find easier, and why?
We found one hot encoding to be easier because it was easier to visualize where each state should go from each value.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
We would want to use binary encoding if the number of states becomes larger than the amount of outputs we have available on the FPGA.
