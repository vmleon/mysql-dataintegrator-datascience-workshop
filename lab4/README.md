# Lab 4: Design and Run your ETL Pipeline.

![DI Pipeline](./images/pipeline_banner.jpeg)

A data flow is a visual program representing the flow of data from source data assets, such as a database or flat file, to target data assets, such as a data lake or data warehouse.

The flow of data from source to target can undergo a series of transforms to aggregate, cleanse, and shape the data.

Data engineers and ETL developers can then analyze or gather insights and use that data to make business decisions.

## Create the Data Flow

Click **Create Data Flow**.

![](images/dataflow_create_button.png)

Set the Name, Project and Description in the New Data Flow Panel

Name: 

```
CSV to MySQL
```

Project or Folder: 

```
My First Project
```

Description: 

```
Data Flow from CSV on Object Storage to MySQL Database
```

To select the Project, click on `My First Project` and **Select**.

![](images/dataflow_select_project.png)

It should look like this:

![](images/dataflow_properties.png)

From the Operators panel, drag and drop the Source icon into the canvas.

![](images/dataflow_source_dnd.png)

Set the Identifier and the rest of the info in the Source Properties panel:

Identifier: 

```
FISH_SURVEY
```

Data Asset: 

```
bucket-study
```

Connection: 

```
Default Connection
```

Schema: 

```
bucket-study
```

Data entity: 

Click **Browse By Name** and select `reef_life_survey_fish.csv`; all the default values are good, click **Select**.

Set the Identifier and then go to Data Asset and click Select.

![](images/dataflow_source_id.png)

From the dropdown, select `bucket-study`. Select `Default Connection` and for Schema the name of the bucket `bucket-study`,

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

At this point, your source has access to the **Attributes**, where you can see the different fields of your dataset.

![](images/dataflow_source_data_entity_attributes.png)

Confirm you can see Attributes and Data.

Let's move into the target for our MySQL Database.

Drag and Drop the **Target** icon into the canvas.

![](images/dataflow_target_dnd.png)


Set the Identifier and the rest of the info in the Target:

Identifier: 

```
MySQL DB
```

Data Asset: 

```
mysql-database
```

Connection: 

```
Default Connection
```

Schema: 

```
nature
```

Data entity: 

```
fish
```

![](images/dataflow_target_id.png)

This time, pick the `mysql-database` data asset. And `Default Connection` one more.

![](images/dataflow_target_data_asset_mysql.png)

For the Schema, select `nature`.

![](images/dataflow_target_data_asset_schema_nature.png)

For Data Entity, we select the table `fish`.

![](images/dataflow_target_data_asset_data_entity.png)


![](images/dataflow_target_data_asset_data_entity_fish.png)

At this point, we can confirm we see the attributes from the table.

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

Name: 

```
IntegrationTaskMySQL
```

Description: 

```
Integration Task MySQL
```

Project or Folder: 

```
My First Project
```

Data Flow: 

```
CSV to MySQL
```

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

Select **IntegrationTaskMySQL**, and click **Publish to Application**.

![](images/di_project_tasks_publish_integration.png)

Select (if not selected by default) your **Default Application**. Click **Publish**.

![](images/di_project_tasks_publish_integration_to_default_app.png)

## Run the Task

Go back  to the **Home** screen and click **Applications**.

![](images/di_application_menu.png)

Select **Default Application**, and you will see your task **IntegrationTaskMySQL**.

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

On the bastion host in Cloud Shell (reconnect if timed out), run the MySQL docker image and in the `bash` Terminal, run:

```
mysqlsh root@PRIVATE_IP
```

Put the MySQL password: `R2d2&C3po!`

Run a query to check the number of rows in the `fish` table. And this is how:

Change to SQL mode:

```
\sql
```

Set `nature` as the Schema in use.

```
use nature;
```

Count the number of rows in the table `fish`.

```sql
select count(1) from fish;
```

## Congratulations, you are ready for the next Lab!

---

[**<< Go to Lab 3**](../lab3/README.md) | [Home](../README.md) | [**Go to Lab 5 >>>>>**](../lab5/README.md)