# ColdFusion Fusebox Tutorial

* Start out with skeleton project.

* Create folder employees with file circuit.xml.cfm.

* Create folder employees/model with file circuit.xml.cfm.

* Create folder employees/view with file circuit.xml.cfm.

* Add data source via ColdFusion Administrator (URL will look like) http://127.0.0.1:8500/CFIDE/administrator/index.cfm.

![Directory Image](/readme/directory_image.PNG?raw=true)

* Go to file fusebox.xml.cfm and create three circuits: one for the controller, one for the model, and one for the view.

```coldfusion
<circuits>
  <circuit alias="employee" path="circuits/employees/" parent="" />
  <circuit alias="memployee" path="circuits/employees/model/" parent="" />
  <circuit alias="vemployee" path="circuits/employees/view/" parent="" />
</circuits>
```

* Create view file employees/view/dspShowEmployees.cfm which acts as the HTML file with embedded cold fusion code.

```coldfusion
<h1>Employees</h1>
<cfloop query = "getEmployees">
	<cfoutput>#getEmployees.Name#</cfoutput><br>
</cfloop>
```

- Go to file employees/view/circuit.xml.cfm to include the template file as part of the view.

```coldfusion
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
<circuit access="internal" xmlns:cf="cf/">
	<fuseaction name="showEmployees">
		<include template="dspShowEmployees.cfm" />
	</fuseaction>
</circuit>
```

- Go to file employees/circuit.xml.cfm to reference the view as a fuse action.

```coldfusion
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
<!-- vdrinks -->
<circuit access="public" xmlns:cf="cf/">
	<fuseaction name="showEmployees">
		<do action="memployee.getEmployees" />
		<do action="vemployee.showEmployees" />
    </fuseaction>
</circuit>
```
