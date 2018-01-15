<h1>Employees</h1>
<cfloop query = "getEmployees">
	<cfoutput>#getEmployees.Name#</cfoutput><br>
</cfloop>