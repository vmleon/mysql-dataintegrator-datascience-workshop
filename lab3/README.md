# Lab 3: Create Data Integrator instance

![Data Integrator](./images/ocidi_banner.png)

This lab walks you through the steps to get started using **Data Integrator** on Oracle Cloud Infrastructure (OCI). You will provision a new instance in just few minutes.

OCI Data Integration is a fully managed, serverless, native cloud service that helps you with common extract, load, and transform (ETL) tasks such as ingesting data from different sources, cleansing, transforming, and reshaping that data, and then efficiently loading it to target data sources on OCI.

## Create Your OCI Data Integrator instance

We need to create some policies to allow Data Integrator service to use other services within OCI.

Go to **Identity** > **Policies**.

![Identity Policy Menu](./images/identity_policies_menu.png)

Click **Create Policy**.

![Create Policy](./images/identity_create_policy.png)


Create a new policy

> Name: `dataintegration`
> 
> Description: `Allow Data Integration Service to use VCN`
>
> Toogle: `Show manual editor`
> 
> Policy Builder: `allow service dataintegration to use virtual-network-family in tenancy`

![Policy fields for DI](./images/identity_policy_fields.png)


> If you have created an Oracle Cloud Account to do the workshop, you are already the Administrator. You DO NOT NEED TO DO THIS STEP.
> 
> In case you are a Non-admin user, you will need to set up some more policies to allow the group you belong to. Ask your administrator.
> 
> ```
> allow group <group-name> to manage dis-workspaces in compartment <compartment-name>
> allow group <group-name> to manage dis-work-requests in compartment <compartment-name>
> allow group <group-name> to use virtual-network-family in compartment <compartment-name>
> allow group <group-name> to manage tag-namespaces in compartment <compartment-name>
> ```

Go to **Menu** > **Data Integration**.

![](./images/di_menu.png)

Click **Create Workspace**.

![](./images/di_create_workshop_button.png)

Modify the following fields, leave the rest as default:

> Name: `Workspace Nature`
> 
> VCN: `nature`
> 
> Subnet: `Private subnet-nature`

Click **Create**.

![](./images/di_create_workshop.png)

While the Workspace is created, click the 3 dots contextual menu.

![](./images/di_creating.png)

Then click **Copy OCID**.

![](./images/di_ocid.png)

Go to **Identity** > **Policies**. We are going to add new policies for our new workspace.

![](./images/di_workspace_policies_menu.png)

Click on `dataintegration` policy name.

![](./images/di_policy_link.png)

Click **Edit Policy Statements**.

![](./images/di_policy_edit_button.png)

Click **+ Another Statement**.

![](./images/di_policy_add_policy.png)

Add 2 more statements and make sure you set the workspace OCID. It will look like this one: 

The first statement:

```
allow any-user to use buckets in tenancy where ALL {request.principal.type='disworkspace', request.principal.id='ocid1.disworkspace.oc1.XX-XXXXXXX-1.XXXXXXXXXXXXXXXXXXX'}
```

The second statement:

```
allow any-user to manage objects in tenancy where ALL {request.principal.type='disworkspace',request.principal.id='ocid1.disworkspace.oc1.XX-XXXXXXX-1.XXXXXXXXXXXXXXXXXXX'}
```

Click **Save Changes**.

![](./images/di_policy_save_changes.png)

Come back to Data Integration, Click **Menu** > **Data Integration**.

![](./images/di_back_to_data_integration.png)

Check the Data Integration Workspace is `Active` and click the link.

![](images/di_active_go_to_workspace.png)

## Create the Data Assets

We are going to need the Object Storage URL and Tenancy ID.

### Get Object Storage URL

Go to Object Storage.

![](./images/os_menu.png)

Click on `bucket-study`.

![](images/os_bucket.png)

On your `reef_life_survey_fish.csv` click on the 3 dots contextual menu.

![](images/os_object_menu.png)

Click on **View Object Details**.

![](images/os_view_object_details.png)

Copy the first part of the URL domain, something like here `https://objectstorage.uk-london-1.oraclecloud.com`.

![](images/os_url.png)

### Get Tenancy OCID

Go to Profile on the top-right corner.

Click on Tenancy.

![](images/profile_tenancy_menu.png)

Tenancy details contains a lot of interesting information. Your Home Region, your **CSI number** for creating support tickets. Also your **Object Storate Namespace**. 

At this point we are interested in the Tenancy OCID. Copy the OCID by clicking on **Copy**. Write it down for the next step.

![](images/tenancy.png)

> You can see that the Object Storage Namespace is here too, in case you need it in the future.

Let's create the Data Asset now.

You can see that by default there is a `Default Application` and a project `My First Project`.

![](./images/di_home_page.png)

The first task is to create the data assets that represent the source and target for the data integration. In our case, the data source is an Object Storage bucket and the target is our MySQL database.

Click **Create Data Asset**.

![](./images/di_home_create_asset_bucket.png)

Fill the fields as follows:

> Name: `bucket-study`
> 
> Description: `Object Storage Bucket with fish survey`
> 
> Type: `Oracle Object Storage`
> 
> URL: `https://objectstorage.<REGION>.oraclecloud.com`
> 
> Tenancy OCID: `ocid1.tenancy.oc1..muahahahahahahahaha`
>
> Click outside the Tenancy OCID field and after few seconds an OS Namespace will be retrieved automatically.

![](images/dataasset_fields1.png)

You can test the connection.

![](images/dataasset_test_connection.png)

After you get a successful test, click **Create**.

![](images/dataasset_test_connection_success.png)

Go back to Home.

![](images/dataasset_os_back_home.png)

Click **Create Data Assets** again.

![](images/dataasset_create_button.png)

This time we are going to create the MySQL database asset with the following values:

> Name: `mysql-database`
> 
> Description: `MySQL Database for Analytics`
> 
> Type: `MySQL`
> 
> Host: `10.0.1.x` (from MySQL created instance)
> 
> Port: `3306`
> 
> Database: `nature`
> 
> User: `root`
> 
> Password: `R2d2&C3po!`

![](images/dataasset_mysql_fields1.png)

![](images/dataasset_mysql_fields2.png)

You can test the connection.

Click **Create**.

![](images/dataasset_mysql_test_create.png)

When the data asset is created, go back to Home.

![](images/dataasset_mysql_success_go_back_home.png)

## Create the Data Flow

Click **Create Data Flow**.

![](images/dataflow_create_button.png)

Set the Name, Project and Description in the New Data Flow Panel

> Name: `CSV to MySQL`
> 
> Project or Folder: `My First Project`
> 
> Description: `Data Flow from CSV on Object Storage to MySQL Database`

To select the Project, click on `My First Project` and **Select**.

![](images/dataflow_select_project.png)

It should look like this:

![](images/dataflow_properties.png)

From the Operators panel, drag and drop the Source icon into the canvas.

![](images/dataflow_source_dnd.png)

Set the Identifier and the rest of the info in the Source Properties panel:

> Identifier: `FISH_SURVEY`
> 
> Data Asset: `bucket-study`
> 
> Connection: `Default Connection`
> 
> Schema: `bucket-study`
> 
> Data entity: click **Browse By Name** and select `reef_life_survey_fish.csv`, all the default values are good, click **Select**.

Set the Identifier and tehn go to Data Asset and click Select.

![](images/dataflow_source_id.png)

From the dropdown, select `bucket-study`. Select `Default Connection` and for schema the name of the bucket `bucket-study`,

![](images/dataflow_source_data_asset_bucket.png)

Finally, select the Data Entity.

![](images/dataflow_source_data_entity.png)

Browse by Name:

![](images/dataflow_source_data_entity_browse.png)

Select `reef_life_survey_fish.csv` file.

![](images/dataflow_source_data_entity_file.png)

And click **Select**.

![](images/dataflow_source_data_entity_file_select.png)

On the dropdown for **File Type**, pick `CSV`.

![](images/dataflow_source_data_entity_file_type.png)

Then click **Select**.

![](images/dataflow_source_data_entity_file_type_csv.png)

At this point, your source has access to the Attributes where you can see the different fields of your dataset.

![](images/dataflow_source_data_entity_attributes.png)

Confirm you can see attributes and Data.

Let's move into the target for our MySQL Database.

Drag and Drop the Target icon into the canvas.

![](images/dataflow_target_dnd.png)


Set the Identifier and the rest of the info in the Target:

> Identifier: `MySQL DB`
> 
> Data Asset: `mysql-database`
> 
> Connection: `Default Connection`
> 
> Schema: `nature`
> 
> Data entity: `fish`

![](images/dataflow_target_id.png)

This time, pick the `mysql-database` data asset. And `Default Connection` one more.

![](images/dataflow_target_data_asset_mysql.png)

For the Schema, select `nature`.

![](images/dataflow_target_data_asset_schema_nature.png)

For Data Entity, we select the table `fish`.

![](images/dataflow_target_data_asset_data_entity.png)


![](images/dataflow_target_data_asset_data_entity_fish.png)

At this point we can confirm we see the attributes from the table.

![](images/dataflow_target_attributes.png)

Time to wire source and target. Drag and drop the link between `FISH_SURVEY` and `MYSQL_DB`.

![](images/dataflow_source_to_target.png)

To build the link between source and target.

![](images/dataflow_source_to_target_linked.png)

Click on the **Map** tab on the Properties panel and drag and drop the `Not Mapped` fields until they are all mapped.

![](images/dataflow_source_to_target_map.png)

Make sure `Not Mapped` in yellow is 0.

![](images/dataflow_source_to_target_map_completed.png)

The final step is to validate the Data flow. Click Validate, check there are no warnings or errors and click **Save and Close**.

![](images/dataflow_validate.png)


## Create the Integration Task

Go back to Home and Click **Create Integration Task**.

![](images/integrationtask_create_button.png)

Set the Name and the rest of the info as follows:

> Name: `IntegrationTaskMySQL`
> 
> Description: `Integration Task MySQL`
> 
> Project or Folder: `My First Project`
> 
> Data Flow: `CSV to MySQL`

![](images/integrationtask_fields.png)

Wait for the Validation of the Data Flow and click **Save and Close**.

![](images/integrationtask_save.png)

## Publish the Integration Task

Go to **Projects** on the home screen.

![](images/di_select_projects.png)

Click on **My First Project**.

![](images/di_select_projects_my_first_project.png)

On the Details menu (left), click on **Tasks**.

![](images/di_project_tasks_menu.png)

Select **IntegrationTaskMySQL** and click **Publish to Application**.

![](images/di_project_tasks_publish_integration.png)

Select (if not selected by default) your **Default Application**. Click **Publish**.

![](images/di_project_tasks_publish_integration_to_default_app.png)

## Run the Task

Go back  to the **Home** screen and click **Applications**.

![](images/di_application_menu.png)

Select **Default Application** and you will see your task **IntegrationTaskMySQL**.

![](images/di_application_integration_dots.png)

Click on the context menu (three dots) and click **Run**.

![](images/di_application_integration_run.png)

Wait few seconds and the Status will change from `Not Started` to `Queued`, then to `Running`.


![](images/di_application_integration_not_started.png)

![](images/di_application_integration_queued.png)

![](images/di_application_integration_running.png)

Feel free to click **Refresh** from time to time until you see `Success` on the Status.

![](images/di_application_integration_success.png)


## It works

On the bastion host in Cloud Shell (reconnect if timed out), and in the Terminal, run:

```
mysqhlsh
```

Run a query to check the number of rows in `fish` table.

Change to SQL mode:

```
\sql
```

Set `nature` as the schema in use.

```
use nature;
```

Count the number of rows in the table `fish`.

```sql
select count(1) from fish;
```

## Congratulations, you are ready for the next Lab!

---

[**<< Go to Lab 2**](../lab2/README.md) | [Home](../README.md) | [**Go to Lab 4 >>>>>**](../lab4/README.md)