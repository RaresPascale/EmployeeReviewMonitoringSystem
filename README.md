# EmployeeReviewMonitoringSystem

Back-end project done using Java with JSP and MySQL for the data base.
For the front-end part I've used HTML and CSS

Description of the app:
  * The purpose of this app was to familiarise with the main operations done on a data base (CRUD), as well as the associations between data bases.
  * This project uses a association of type many to many (M:N)

The tabels in the data base:
  * Employees - primary key: idemployees, with the other atributes: name, surname. salary
  * Reviews - primary key: idreview, with the other atributes: date, review and written_by
  * HR - the linking table in order to ensure a M:N relation

The functionality of the app:
  * A DB package: contains the JavaBean class - offers the main functionalities of the app -                                                  conexion and CRUD
  * webapp folder: contains all the JSP pages - they realise the dynamic part of the app
