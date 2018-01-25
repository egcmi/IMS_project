Please copy the file 'uniscout' into the htdocs folder of XAMPP.
Please create a new database called uniscout in localhost/phpmyadmin and import the uniscout.sql file (found in db folder) into it.
Please to access Uniscout turn on the Apache and the MySQL server on XAMPP.
Please access it through the address 127.0.0.1/uniscout/home.html (if you use localhost instead of 127.0.0.1 the captcha will not work).

To have our scheduler working, it is needed that the event is on the following day, so please change the date of one of our events to the following day.
To receive an email, a participant needs to subscribe to that particular event.
To run the scheduler please select the time in the file libs/scheduler/Scheduler.java and compile the file in that folder.
The scheduler can then be run by running the scheduler.bat (or scheduler.sh for linux) file in the root folder uniscout.
The emails will be sent in the time specified in the Scheduler.java file.

If it is needed to send the email in the precise moment, without waiting, please use the scheduler_now (.bat for windows, and .sh for linux) file.
In case of any problem with the .sh or .bat files, please run the commands in the libs/scheduler folder:

javac Scheduler.java
java Scheduler

or

javac Scheduler_now.java
java Scheduler_now

