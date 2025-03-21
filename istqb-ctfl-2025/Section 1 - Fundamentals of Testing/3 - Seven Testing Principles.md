[🔙 Back to Index](../index.md)

# Seven Testing Principles

1. Testing shows presence of defects, not their absence
2. Exhaustive testing is impossible
3. Early testing saves time and money
4. Defect cluster together
5. Pesticide Paradox – Tests wear out
6. Testing is context dependent
7. Absence-of-errors fallacy

### Testing shows presence of defects, not their absence
Testing reduces the probability of undiscovered defects remaining in the software but, even if no defects are found, 
this is not a proof of correctness. 

### Exhaustive testing is impossible
Testing everything (all combinations of inputs and preconditions) is not feasible.
Instead, risk analysis and priorities should be used to focus testing efforts

**Example**
* A simple 20 screen application with 3 menus and 3 options per menu
* There are 12 fields per screen, 2 types of input (number as integer or
decimal) and about 120 possible values.
* How many tests would be needed for exhaustive testing? 
* Total tests for exhaustive testing: 20 x 3 x 3 x 12 x 2 x 120 = 518.400 tests
* If each tests takes 1 second, exhaustive testing takes 8.640 minutes, 144
hours, 18 working days 

### Early testing saves time and money
To find defects early, testing activities should be started as early as possible in the software development lifecycle.
and should be focused on defined objectives

### Defect cluster together
Testing effort should be focused proportionally to the expected and later observed defect density of modules.

### Pesticide Paradox – Tests wear out
If the same tests are repeated over and over again, they will no longer find any new defects. 
To overcome this test cases need to be reviewed and revised, to exercise different parts of the software.

### Testing is context dependent
Testing is done differently in different contexts. For example, safety-critical software is tested differently from an e-commerce site 
and Agile testing differs from sequential testing.

### Absence-of-errors fallacy
Finding and fixing defects does not help if the system built is unusable and does not fulfill the users needs and expectations. 
Besides verification, validation should also be done.