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

## Create Jupyter Notebook environment

Click on Notebook **Python [conda env:root]**.

Click **File** > **Rename Notebook...** and use a better name like:

> New Name: `FishSurvey.ipynb`

Click on **File** > **New Console for Notebook**.

Type

`conda install -c anaconda mysql-connector-python`

Wait for the confirmation of the MySQL connector installation.

```
...
Downloading and Extracting Packages
protobuf-3.6.0       | 610 KB    | ##################################### | 100% 
pyopenssl-19.1.0     | 47 KB     | ##################################### | 100% 
ca-certificates-2020 | 128 KB    | ##################################### | 100% 
libprotobuf-3.6.0    | 4.1 MB    | ##################################### | 100% 
mysql-connector-pyth | 776 KB    | ##################################### | 100% 
six-1.15.0           | 13 KB     | ##################################### | 100% 
certifi-2020.6.20    | 160 KB    | ##################################### | 100% 
openssl-1.1.1h       | 3.8 MB    | ##################################### | 100% 
mysql-connector-c-6. | 2.7 MB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: failed

RemoveError: 'pyopenssl' is a dependency of conda and cannot be removed from
conda's operating environment.


Note: you may need to restart the kernel to use updated packages.
```

Restart Kernel by going to **Kernel** > **Restart Kernel...**. Confirm you want to proceed.

Run the following command

```
import mysql.connector

mydb = mysql.connector.connect(
  host="MYSQL_PRIVATE_IP",
  user="root",
  passwd="R2d2&C3po!"
)

print(mydb)
```

# Congratulations! Well done!

Continue to the Next Steps for more information!

---

[**<< Go to Lab 4**](../lab4/README.md) | [Home](../README.md) | [**Next Steps >>>>>**](../next/README.md)