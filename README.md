# ColdFusion Fusebox Tutorial

* Start out with skeleton project.

* Create folder employees with file circuit.xml.cfm.

* Create folder employees/model with file circuit.xml.cfm.

* Create folder employees/view with file circuit.xml.cfm.

![Directory Image](/readme/directory_image.PNG?raw=true)

* Add data source via ColdFusion Administrator (URL will look like) http://127.0.0.1:8500/CFIDE/administrator/index.cfm.

![Data Source Image](/readme/data_source_image.PNG?raw=true)
![Client Variable Image](/readme/client_variable_image.PNG?raw=true)

* Go to file fusebox.xml.cfm and create three circuits: one for the controller, one for the model, and one for the view.

```coldfusion
<circuits>
  <circuit alias="employee" path="circuits/employees/" parent="" />
  <circuit alias="memployee" path="circuits/employees/model/" parent="" />
  <circuit alias="vemployee" path="circuits/employees/view/" parent="" />
</circuits>
```

* Create model file employees/model/svcGetEmployees.cfm

```coldfusion
<cfquery name="getEmployees" datasource="BrentColdfusionFuseboxDemo">
 SELECT Name, Position, Age, HiredDate
 FROM dbo.Employee;
</cfquery>
```

* Go to file employees/model/circuit.xml.cfm to include the template file as part of the model.

```coldfusion
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
<circuit access="internal" xmlns:cf="cf/">
	<fuseaction name="getEmployees">
		<include template="svcGetEmployees.cfm"/>
	</fuseaction>
</circuit>
```

* Create view file employees/view/dspShowEmployees.cfm which acts as the HTML file with embedded cold fusion code.

```coldfusion
<h1>Employees</h1>
<cfloop query = "getEmployees">
	<cfoutput>#getEmployees.Name#</cfoutput><br>
</cfloop>
```

* Go to file employees/view/circuit.xml.cfm to include the template file as part of the view.

```coldfusion
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
<circuit access="internal" xmlns:cf="cf/">
	<fuseaction name="showEmployees">
		<include template="dspShowEmployees.cfm" />
	</fuseaction>
</circuit>
```

- Go to file employees/circuit.xml.cfm to combine the model and the view as a fuse action. This fuse action can be called via the URL. The actions within the fuse action matters as the code is ran in order and variables persist between actions.

```coldfusion
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
<circuit access="public" xmlns:cf="cf/">
	<fuseaction name="showEmployees">
		<do action="memployee.getEmployees" />
		<do action="vemployee.showEmployees" />
    </fuseaction>
</circuit>
```

### Notes

The parsed folder holds the automatically generated files that are required to run fuse actions. Editing the files and refreshing the page rarely works to refresh the fuse actions. Instead, there are a variety of query parameters you can throw in the URL. If none of these work, refreshing the Cold Fusion server via Cold Fusion builder, restarting the service ColdFusion 11 Application Server, and simply restarting your computer may help to properly refresh these parsed files.

* Consistently works. It may help to delete all of the files within the parsed folder first.

```
?fusebox.parseall=true
```

* Saied says this works sometimes. Password might need to match `<parameters><parameter name="password" value="skeleton" /></parameters>` in file fusebox.xml.cfm.

```
?fusebox.load=true&fusebox.parse=true&fusebox.password=password&fusebox.loadclean=true  
```

* Haven't tried.

```
?fusebox.loadclean=true
?fusebox.load=true
```
