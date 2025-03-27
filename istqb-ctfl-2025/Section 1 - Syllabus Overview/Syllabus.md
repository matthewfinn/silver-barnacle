[🔙 Home](../home.md)

**Source:** [ISTQB_CTFL_Syllabus-v4.0_EN_.pdf](../Resources/resources/ISTQB_CTFL_Syllabus-v4.0_EN_.pdf)

# 1.1. What is Testing?
Software systems are an integral part of our daily life. Most people have had experience with software that did not work as expected. Software that does not work correctly can lead to many problems, including loss of money, time or business reputation, and, in extreme cases, even injury or death.
Software testing assesses software quality and helps reducing the risk of software failure in operation. 

Software testing is a set of activities to discover defects and evaluate the quality of software artifacts.
These artifacts, when being tested, are known as test objects. A common misconception about testing is that it only consists of executing tests (i.e., running the software and checking the test results). However, software testing also includes other activities and must be aligned with the software development lifecycle (see chapter 2).

Another common misconception about testing is that testing focuses entirely on verifying the test object. Whilst testing involves verification, i.e., checking whether the system meets specified requirements, it also involves validation, which means checking whether the system meets users’ and other stakeholders’ needs in its operational environment.

Testing may be dynamic or static. Dynamic testing involves the execution of software, while static testing does not. Static testing includes reviews (see chapter 3) and static analysis. 
Dynamic testing uses different types of test techniques and test approaches to derive test cases (see chapter 4).

Testing is not only a technical activity. It also needs to be properly planned, managed, estimated, monitored and controlled (see chapter 5).

Testers use tools (see chapter 6), but it is important to remember that testing is largely an intellectual activity, requiring the testers to have specialised knowledge, 
use analytical skills and apply critical thinking and systems thinking (Myers 2011, Roman 2018).

The ISO/IEC/IEEE 29119-1 standard provides further information about software testing concepts.

## 1.1.1. Test Objectives
The typical test objectives are:
* Evaluating work products such as requirements, user stories, designs, and code
* Triggering failures and finding defects
* Ensuring required coverage of a test object
* Reducing the level of risk of inadequate software quality
* Verifying whether specified requirements have been fulfilled
* Verifying that a test object complies with contractual, legal, and regulatory requirements
* Providing information to stakeholders to allow them to make informed decisions
* Building confidence in the quality of the test object
* Validating whether the test object is complete and works as expected by the stakeholders

Objectives of testing can vary, depending upon the context, which includes the work product being tested, the test level, risks, the software development lifecycle (SDLC) being followed, and factors related to the business context, e.g., corporate structure, competitive considerations, or time to market.

## 1.1.2. Testing & Debugging
Testing and debugging are separate activities. Testing can trigger failures that are caused by defects in the software (dynamic testing) or can directly find defects in the test object (static testing).
When dynamic testing (see chapter 4) triggers a failure, debugging is concerned with finding causes of this failure (defects), analyzing these causes, and eliminating them. The typical debugging process in this case involves: 
* Reproduction of a failure
* Diagnosis (finding the root cause)
* Fixing the cause

Subsequent confirmation testing checks whether the fixes resolved the problem. Preferably, confirmation testing is done by the same person who performed the initial test. 
Subsequent regression testing can also be performed, to check whether the fixes are causing failures in other parts of the test object (see section 2.2.3 for more information on confirmation testing and regression testing).

When static testing identifies a defect, debugging is concerned with removing it. There is no need for reproduction or diagnosis, since static testing directly finds defects, and cannot cause failures (see chapter 3).

# 1.2. Why is Testing Necessary?
Starts on slide 16 of [ISTQB_CTFL_Syllabus-v4.0_EN_.pdf](../Resources/resources/ISTQB_CTFL_Syllabus-v4.0_EN_.pdf)
!!!! Updated Syllabus downloaded v4.0.1 !!! - [ISTQB_CTFL_Syllabus_v4.0.1.pdf](../Resources/resources/ISTQB_CTFL_Syllabus_v4.0.1.pdf)