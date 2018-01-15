<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fusebox>
<!--
	Example fusebox.xml control file. Shows how to define circuits, classes,
	parameters and global fuseactions.
	This is just a test namespace for the plugin custom attribute example
-->
<fusebox xmlns:test="test">
	<circuits>
		<circuit alias="employee" path="circuits/employees/" parent="" />
		<circuit alias="memployee" path="circuits/employees/model/" parent="" />
		<circuit alias="vemployee" path="circuits/employees/view/" parent="" />
	</circuits>
	<classes>
	</classes>
	<parameters>
		<!--
		These are all default values that can be overridden:-->
		<parameter name="fuseactionVariable" value="fuseaction" />
		<parameter name="precedenceFormOrUrl" value="form" />
		<parameter name="scriptFileDelimiter" value="cfm" />
		<parameter name="maskedFileDelimiters" value="htm,cfm,cfml,php,php4,asp,aspx" />
		<parameter name="characterEncoding" value="utf-8" />
		<paramater name="strictMode" value="false" />
		<parameter name="allowImplicitCircuits" value="false" />
		<parameter name="debug" value="false" />
	</parameters>
	<globalfuseactions>
		<preprocess>
		</preprocess>
		<postprocess>
			<!--<fuseaction action="layout.checkLayout" />-->
		</postprocess>
	</globalfuseactions>
	<plugins>
		<phase name="preProcess">
		</phase>
		<phase name="preFuseaction">
		</phase>
		<phase name="postFuseaction">
		</phase>
		<phase name="fuseactionException">
		</phase>
		<phase name="postProcess">
		</phase>
		<phase name="processError">
		</phase>
	</plugins>
</fusebox>