openhds-from-hrs2
=================

###Tools for migration of legacy data from HRS2 to OpenHDS

A set of scripts that enable the migration of legacy data from the HRS2 system to OpenHDS. The process is documented in the section "Migration of legacy data to OpenHDS" in the [OpenHDS manual](https://github.com/SwissTPH/openhds/blob/master/doc/OpenHDS_Manual.pdf?raw=true). 

The necessary steps can be tried using a set of tables from the HRS2 system populated with synthetic data in this repository.

__Warning__: this should be run on a test system, all data in the openhds database will be deleted during the following steps.

###Preqequisites:

We assume a complete OpenHDS server installation, including Mirth channels (in particular MigrationChannel and Database Error Writer), and a mysql database called odk_prod (only for the database table to write errors to). The tutorial makes a number of assumptions about URLs, user credentials, and datbase naming conventions. The simplest and recommended approach for following this tutorial is to launch the OpenHDS evaluation platform (link to follow shortly). 

###Tutorial:

Follow the steps described in [OpenHDS manual](https://github.com/SwissTPH/openhds/blob/master/doc/OpenHDS_Manual.pdf?raw=true) to migrated a small common-denomitaor HRS2 database to OpenHDS. Script 00_migrate.sh calls all the script corresponding to the transformation in correct order. This may be used to build a migration workflow adapted to your local version of HRS2.
