# ColdFusion Fusebox Tutorial

⋅⋅* Start out with skeleton project

⋅⋅* Create folder employees with file circuit.xml.cfm.

⋅⋅* Create folder employees/model with file circuit.xml.cfm.

⋅⋅* Create folder employees/view with file circuit.xml.cfm.

⋅⋅* Go to file fusebox.xml.cfm and create three circuits: one for the controller, one for the model, and one for the view. Circuits tag should look like this:

```
<circuits>
  <circuit alias="employee" path="circuits/employees/" parent="" />
  <circuit alias="memployee" path="circuits/employees/model/" parent="" />
  <circuit alias="vemployee" path="circuits/employees/view/" parent="" />
</circuits>
```
