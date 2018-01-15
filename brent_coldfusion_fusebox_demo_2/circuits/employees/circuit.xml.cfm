<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
<circuit access="public" xmlns:cf="cf/">
	<fuseaction name="showEmployees">
		<do action="memployee.getEmployees" />
		<do action="vemployee.showEmployees" />
		
		
    </fuseaction>
</circuit>