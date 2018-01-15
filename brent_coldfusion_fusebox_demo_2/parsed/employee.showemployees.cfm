<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: employee --->
<!--- fuseaction: showEmployees --->
<cftry>
<!--- do action="memployee.getEmployees" --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "memployee">
<cfset myFusebox.thisFuseaction = "getEmployees">
<cftry>
<cfoutput><cfinclude template="../circuits/employees/model/svcGetEmployees.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 19 and right(cfcatch.MissingFileName,19) is "svcGetEmployees.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse svcGetEmployees.cfm in circuit memployee which does not exist (from fuseaction memployee.getEmployees).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<!--- do action="vemployee.showEmployees" --->
<cfset myFusebox.thisCircuit = "vemployee">
<cfset myFusebox.thisFuseaction = "showEmployees">
<cftry>
<cfoutput><cfinclude template="../circuits/employees/view/dspShowEmployees.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 20 and right(cfcatch.MissingFileName,20) is "dspShowEmployees.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dspShowEmployees.cfm in circuit vemployee which does not exist (from fuseaction vemployee.showEmployees).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

