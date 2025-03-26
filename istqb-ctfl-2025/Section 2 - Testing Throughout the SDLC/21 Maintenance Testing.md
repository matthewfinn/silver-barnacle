[🔙 Home](../home.md)

# Maintenance Testing

* Testing the changes to an operational system or the impact of a changed environment on an operational system
* Changes are inevitable and include:
  * Corrective - Fixes of defects
  * Adaptive to changes in the environment 
  * Preserve or improve non-functional quality aspects such as:
    * Performance
    * Compatibility
    * Reliability
    * Security
    * Portability
    * Maintainability
* Can involve:
  * Planned releases/ deployments
  * Unplanned releases / deployments (hotfixes)
  * Confirmation Testing
  * Regression Testing
* Common practice:
  * Have maintenance slots available
  * Use if needed, ignore if not needed

### Triggers for Maintenance
* Modifications (planned enhancements, corrective and (emergency) changes, patches for defects and vulnerabilities)
* Upgrades or migrations of the operational environment:
  * From one platform to another – tests in the new environment AND the changed software
  * Data from one application into the system being maintained
* Retirement of an application:
  * Data archiving
  * Restore and retrieval procedures

### Impact Analysis for Maintenance
* Identify intended consequences
* Identify expected and possible side effects
* Identify areas in the system that will be affected by the change
* Help to identify the impact of a change on existing tests
* May be done before a change is made and can be taken into account to determine whether a change should be made
* Impact Analysis can be difficult if:
  * Specifications are old or missing
  * Test cases are old or not documented
  * There is no maintained bi-directional traceability
  * Tool support is weak or non-existent
  * People involved do not have domain and/or system knowledge
  * Insufficient attention has been paid to the software’s maintainability during development