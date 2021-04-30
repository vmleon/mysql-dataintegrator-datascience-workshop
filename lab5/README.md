# Lab 5: Transform your Data into Insights

![Data Science](images/ds_banner.jpg)

**Oracle Data Science**: Build high-quality models faster and easier. Automated machine learning capabilities rapidly examine the data and recommend the optimal data features and best algorithms. Additionally, automated machine learning tunes the model and explains the model’s results.

## Create Policies

Create Dynamic Group, go to **Menu** > **Identity & Security** > **Dynamic Groups**.

![](images/ds_dynamic_group_menu.png)

Click **Create Dynamic Group**.

![](images/ds_dynamic_group_create_button.png)

Set the following values:

Name:
```
datascience
```

Description:
```
Data Science Dynamic Group
```

Rule 1 (Matching Rules):
```
ALL { resource.type = 'datasciencenotebooksession' }
```

Click **Create**.

![](images/ds_dynamic_group_create.png)

The Dynamic Group for Data Science has been created.

![](images/ds_dynamic_group_review.png)

---

Create Policies for Data Science:

Go to **Menu** > **Identity & Security** > **Policies**.

![](images/identity_policies_menu.png)

Click **Create Policy**.

Make sure you are in the `root` compartment.

![](images/ds_policies_create_button.png)

Use the following information:

Name:
```
datascience
```

Description:
```
Data Science to use network resources
```

Toggle **Show manual editor**

Policy Builder:
```
allow service datascience to use virtual-network-family in tenancy
allow dynamic-group datascience to manage data-science-family in tenancy
```

Click **Create**.

![](images/ds_policies_create.png)

The Policy for Data Science has been created.

![](images/ds_policies_create_review.png)

> If you have created an Oracle Cloud Account to do the workshop, you are already the Administrator. You DO NOT NEED TO DO THIS STEP.
> 
> In case you are a Non-admin user, you will need to set up some more policies to allow the group you belong to. Ask your administrator.
> 
> ```
> allow group <data-scientists> to use virtual-network-family in tenancy
> allow group <data-scientists> to manage data-science-family in tenancy
> ```

---

## Create a Data Science Project

Go to **Menu** > **Analytics & AI** > **Data Science**.

![](images/ds_menu.png)

Click **Create Project**.

![](images/ds_create_project_button.png)

Set the name and description as follows:

Name: 
```
Nature
```

Description: 
```
Fish Survey notebook
```

Click **Create**.

![](images/ds_create_project.png)

The next step is to create a Notebook, click **Create Notebook Session**.

![](images/ds_create_notebook.png)

Set the following values:

Name: 

```
Fish Survey
````

Compute Instance Shape (but other compatible shapes would work as well): 

```
VM.Standard.E2.2
```

Block Storage Size: 

```
50
````

VCN: 

```
nature
````

Subnet: 

```
Private Subnet-nature
````

Click **Create**.

![](images/ds_create_notebook_create.png)

The status icon will change from Creating to Active:

![Creating](images/datascience-creating.png)

![Active](images/datascience-active.png)

When the Notebook is active, click **Open**.

![](images/ds_create_notebook_open.png)

Log-in into your Notebook. Click **Continue** and you should be in your notebook as you are using your same OCI Web Console user. Otherwise, log in with your specific user.

![](images/ds_notebook_login.png)

---

## Install libraries

Welcome to your Jupyter Notebook, click **Terminal**.

![](images/ds_notebook_terminal.png)


And type the following command:

```
pip install mysql-connector-python pandas seaborn
```

![](images/ds_notebook_terminal_install.png)

Wait for the installation to complete.

---

## Create Jupyter Notebook environment

Download the Notebook [here](https://raw.githubusercontent.com/vmleon/mysql-dataintegrator-datascience-workshop/main/lab5/files/FishSurvey.ipynb).

Click **Upload files**.

![](images/ds_notebook_upload.png)

Select `FishSurvey.ipynb` from your disk. Wait for the upload to complete.

Your `FishSurvey.ipynb` will be loaded on the side panel.

![](images/ds_notebook_fish_notebook.png)

Double click on **FishSurvey.ipynb**.

Make sure you modify `PRIVATE_IP` on the following code in the Notebook with the Private IP from your MySQL Database System.

```
cnx = mysql.connector.connect(
  host="PRIVATE_IP",
  user="root",
  passwd="R2d2&C3po!",
  database="nature"
)
```

![](images/ds_notebook_fish_notebook_run.png)

Select the rest paragraph (called Cell) of the Notebook and run the Notebook cell by cell by clicking the **play** icon over and over until you reach the end.

![](images/ds_notebook_fish_notebook_head.png)

Check the plot.

![](images/ds_notebook_fish_notebook_plot.png)

## Congratulations! Well done!

Continue to the Next Steps for more information!

---

[**<< Go to Lab 4**](../lab4/README.md) | [Home](../README.md) | [**Next Steps >>>>>**](../next/README.md)