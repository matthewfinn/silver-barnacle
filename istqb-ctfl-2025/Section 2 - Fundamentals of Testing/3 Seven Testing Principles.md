[🔙 Home](../home.md)

# Seven Testing Principles

1. Testing shows presence of defects, not their absence
2. Exhaustive testing is impossible
3. Early testing saves time & money
4. Defect cluster together
5. Pesticide Paradox – Tests wear out
6. Testing is context dependent
7. Absence-of-errors fallacy

### 1. Testing shows presence of defects, not their absence

Testing reduces the probability of undiscovered defects remaining in the software but, even if no defects are found, this is not a proof of correctness.

**Example:**
A team tests an e-commerce website and finds 10 critical bugs. Fixing them doesn't guarantee the system is now bug-free — other undetected defects may still exist.

### 2. Exhaustive testing is impossible

Testing everything (all combinations of inputs &p reconditions) is not feasible.
Instead, risk analysis&priorities should be used to focus testing efforts

**Example**

* A simple 20 screen application with 3 menus & 3 options per menu
* There are 12 fields per screen, 2 types of input (number as integer or decimal) & about 120 possible values
* How many tests would be needed for exhaustive testing?
* Total tests for exhaustive testing: 20 x 3 x 3 x 12 x 2 x 120 = 518.400 tests
* If each tests takes 1 second, exhaustive testing takes 8,640 minutes, 144
  hours, 18 working days

### 3. Early testing saves time & money

To find defects early, testing activities should be started as early as possible in the software development lifecycle and should be focused on defined objectives

**Example**
If a banking app has a requirement mistake (e.g., interest is calculated incorrectly), fixing it in the design phase is **much cheaper** than after development and release.

### 4. Defect cluster together

Testing effort should be focused proportionally to the expected & later observed defect density of modules.

**Example**
In a mobile app, most crashes happen in one specific feature, like the payment system, while other parts work fine. Testers focus more on that high-risk area.

### 5. Pesticide Paradox – Tests wear out

If the same tests are repeated over & over again, they will no longer find any new defects.
To overcome this test cases need to be reviewed & revised, to exercise different parts of the software.

**Example**
A tester always follows the same script for testing a shopping cart. Over time, no new defects are found. But when they try different payment methods, they discover a security issue.

### 6. Testing is context dependent

Testing is done differently in different contexts i.e. The testing approach depends on the application type.

**Example**
For example, safety-critical software is tested differently from an e-commerce site and Agile testing differs from sequential testing. A banking app requires strict security & functional testing. A mobile game focuses more on usability and performance testing.

### 7. Absence-of-errors fallacy

Finding & fixing defects does not help if the system built is unusable & does not fulfill the users needs & expectations. Besides verification, validation should also be done.

**Example**
A perfectly coded expense tracker app passes all tests but fails in the market because it’s too complex to use.
