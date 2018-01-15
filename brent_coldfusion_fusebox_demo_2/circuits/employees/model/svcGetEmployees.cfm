<cfquery name="getEmployees" datasource="BrentColdfusionFuseboxDemo">
 SELECT Name, Position, Age, HiredDate
 FROM dbo.Employee;
</cfquery>