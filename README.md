67-272: Cafe23 Project
===

A project for CMU course 67-272: Application Design & Development, developing a full-stack web-app to allow a hypothetical cafe chain (Cafe23) manage stores, employees, shifts, payroll, and more.


**Instructions**
To run, clone this repository locally to your machine. Run `rails db:context` and `rails server`. The web-app can be accessed at `localhost:3000/login`.


**User Accounts**
The Cafe23 web-app supports three types of users: Employees, Managers, and Admins.


*Employees:*
username: ralph
password: secret

Ralph logs in and is immediately taken to a list of upcoming shifts the employee is scheduled for. If one of the shifts on the list is schedule for today, then there will be an option on the page to start the shift. Choosing that option will start the time clock and begin the shift and he receives appropriate feedback that this is the case.

Ralph logs in and is immediately taken to a list of upcoming shifts the employee is scheduled for. If one of the shifts on the list is schedule already under way, then there will be an option on the page to end the shift. Choosing that option will stop the time clock and end the shift and he receives appropriate feedback that this is the case.


*Manager:*
username: kathryn
password: secret

Kathryn logs in and chooses the payroll option for stores. She gets a form that allows her to choose a start and end date that the payroll report will cover; unlike He, there is no option to select a store as the manager's current store is assumed. After entering this information, she gets a report for the store and time period in question. This report provides in list form the payroll report for each employee who has a shift in the time period; the contents of the employee report match the requirements of the comparable admin scenario.

Kathryn logs in to create a new shift for an employee. She gets a form that allows her to select the active employee for the shift, the date of the shift, and the start time of the shift. If the end time is felt blank, the system will make the end time 3 hours after start time; otherwise the end time will be whatever she sets it to. Upon submission, she gets appropriate feedback that the task has been correctly completed.

Kathryn logs in to record a job to a completed shift. In this case, she clicks on the first completed shift for Ralph Wilson. Seeing that Ralph worked the cashier job, she also adds the job of barista to the jobs Ralph completed that shift. Upon submission, she gets appropriate feedback that the task has been correctly completed.


*Administrator*
username: alex
password: secret

Alex logs in and chooses the payroll option for employees. He gets a form that allows him to choose the employee he wants to calculate payroll for, as well as a start and end date that the payroll report will cover. After entering this information, he gets a report on the employee's payroll, including the time period in question, the employee name, SSN, current pay grade, current rate, the number of hours worked in that period, and the money earned for that work.

Alex logs in and chooses the payroll option for stores. He gets a form that allows him to choose the store he wants to calculate payroll for, as well as a start and end date that the payroll report will cover. After entering this information, he gets a report for the store and time period in question. This report provides in list form the payroll report for each employee who has a shift in the time period; the contents of the employee report match the requirements of the first scenario.

Alex logs in and creates a new employee, Luke Skywalker. Once it is confirmed that Luke has been added to the system, he assigns Luke to the CMU store. Upon submission, he get appropriate feedback that the task has been correctly completed.