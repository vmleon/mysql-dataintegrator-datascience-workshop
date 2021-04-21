# Lab 2: Create MySQL Database System

![MySQL Database System](./images/mds_banner.png)

**MySQL Database System** is a fully-managed Oracle Cloud Infrastructure service, developed, managed, and supported by the MySQL team in Oracle..

## Create an instance of MySQL in the cloud

Go to **Menu** > **MySQL** > **DB Systems**.

![](./images/mysql_menu.png)

Click **Create MySQL DB System**.

Make sure your root compartment (or the one you want) is selected.

![](./images/mysql_create_button.png)

Name your MySQL instance

> Name: `mysql-analytics`
> 
> Description (optional): `MySQL instance for Analytics`

Between the three options, pick `HeatWave`. `Standalone` will work for the test but it doesn't include the Analytics Engine that will improve performance for Analytics.

For Username and password

> Username: `root`
> 
> Password: `R2d2&C3po!`
> 
> ConfirmPassword: `R2d2&C3po!`

![](./images/mysql_create_db_fields.png)

Network configuration:

> Virtual Cloud Network: `nature`
> 
> Subnet: `Private Subnet-nature (Regional)`

![](./images/mysql_vcn_fields.png)

Everything else is good by default:

> Configure placement: `AD-1`
> 
> Configure hardware: `MySQL.HeatWave.VM.Standard.E3` or `MySQL.VM.Standard.E3.1.8GB` for Standalone (selected above)
> 
> Data Storage Size (GB): `50`
> 
> Configure Backups: `Enable Automatic Backups`

Click **Create**.

![](./images/mysql_shape_fields.png)

The provisioning is around 10 minutes. The icon should change to `ACTIVE` in green:

![Provisioning](./images/mds-provisioning.png)

![Active](./images/mds-active.png)

Copy the private IP address from the MySQL DB System Information page, it will look like `10.0.1.xxx`.

![](images/mysql_private_ip.png)

## Connect and create DB

Connect with Cloud Shell (if not still active).

![](./images/cloud_shell.png)

XXX

![](./images/cloud_shell_upload_sql.png)

XXX

![](./images/cloud_shell_upload.png)

XXX

![](./images/cloud_shell_upload_select_file.png)

XXX

![](./images/cloud_shell_upload_completed.png)

From your bastion host with MySQL Shell we are going to prepare your MySQL Database for the data.

Download the file [SQL Fish Survey](./files/create_fish_survey.sql).

Copy the file into the bastion host with (replace `PUBLIC_IP` with your bastion host IP):

`scp create_fish_survey.sql opc@PUBLIC_IP:/home/opc/`

SSH into the bastion host and type:

`ssh opc@PUBLIC_IP`

Run a docker image with MySQL Shell:

`sudo docker run -it --rm --name mysql -v $(pwd):/tmp mysql/mysql-server bash`

When in the docker container, type `mysqlsh`

Run the script with:

```
cat /tmp/create_fish_survey.sql | mysqlsh --sql root@<PRIVATE_IP>
```

It will ask for the password (`Please provide the password for 'root@PRIVATE_IP':`). Type the MySQL DB password.

If there is no error on the console, everything is ready to proceed.

![Create Schema Terminal](./images/create_schema_mysql_terminal.png)

## Enable HeatWave

XXX

## Congratulations! You are ready to go to the next Lab!

---

[**<< Go to Lab 1**](../lab1/README.md) | [Home](../README.md) | [**Go to Lab 3 >>>>>**](../lab3/README.md)