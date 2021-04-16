# Lab 5: Transform your Data into Insights

![Data Science](./images/ds_banner.jpg)

**Oracle Data Science** XXX.

## Create Policies

Create Dynamic Group

`ALL { resource.type = 'datasciencenotebooksession' }`

Create Policies

In the root compartment

`allow service datascience to use virtual-network-family in tenancy`

`allow dynamic-group <dynamic-group> to manage data-science-family in tenancy where <dynamic-group> represents the name of your dynamic group`

Non-Administrators

`allow group <data-scientists> to use virtual-network-family in tenancy`

`allow group <data-scientists> to manage data-science-family in tenancy where <data-scientists> represents the name of your user group`

## Create a Data Science Project

Go to Menu > Data Science > Projects.

Click **Create Project**.

Set the name and description as follows:

> Name: `Nature`
> Description: `Fish Survey notebook`

The next step is to create a Notebook, click **Create Notebook Session**.

Set the following values:

> Name: `Fish Survey`
> Compute Instance Shape: `VM.Standard.E2.2` but others will work as well.
> Block Storage Size: `50`
> VCN: `nature`
> Subnet: `Private Subnet-nature`

Click **Create**.

The status icon will change from Creating to Active:

![Creating](./images/datascience-creating.png)

![Active](./images/datascience-active.png)

When the Notebook is active, click **Open**.

## Install libraries

Click **Terminal**.

`pip install mysql-connector-python pandas seaborn`

Wait for the installation to complete.

## Create Jupyter Notebook environment

Click on **+** to open the Launcher again.

Download the Notebook [here](files/FishSurvey.ipynb).

Click **Upload files** and select `FishSurvey.ipynb` from your disk.

Click on **FishSurvey.ipynb** on the left list of files.

Make sure you modify `PRIVATE_IP` on the following code in the Notebook with the Private IP from your MySQL Database System.

```
cnx = mysql.connector.connect(
  host="PRIVATE_IP",
  user="root",
  passwd="R2d2&C3po!",
  database="nature"
)
```

Run the Notebook cell by cell clicking the **play** icon over and over until you reach the end.

# Congratulations! Well done!

Continue to the Next Steps for more information!

---

[**<< Go to Lab 4**](../lab4/README.md) | [Home](../README.md) | [**Next Steps >>>>>**](../next/README.md)