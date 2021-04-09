# Lab 2: Create MySQL Database Service

![MySQL Database Service](./images/mds_banner.png)

**MySQL Database Service** XXX.

## Create an instance of MySQL in the cloud

Go to Menu > MySQL > DB Systems.

Click **Create MySQL DB System**.

Make sure your root compartment (or the one you want) is selected.

Name your MySQL instance

> Name: `mysql-analytics`
> Description (optional): `MySQL instance for Analytics`

Between the three options, pick `HeatWave`. `Standalone` will work for the test but it doesn't include the Analytics Engine that will improve performance for Analytics.

For Username and password

> Username: `root`
> Password: `R2d2&C3po!`
> ConfirmPassword: `R2d2&C3po!`

Network configuration:

> Virtual Cloud Network: `nature`
> Subnet: `Private Subnet-nature (Regional)`

Everything else is good by default:

> Configure placement: `AD-1`
> Configure hardware: `MySQL.HeatWave.VM.Standard.E3` or `MySQL.VM.Standard.E3.1.8GB` for Standalone (selected above)
> Data Storage Size (GB): `50`
> Configure Backups: `Enable Automatic Backups`

Click **Create**.

The provisioning is around 10 minutes. The icon should change to `ACTIVE` in green:

![Provisioning](./images/mds-provisioning.png)

![Active](./images/mds-active.png)

Copy the private IP address from the MySQL DB System Information page.

## Connect and create DB

From your bastion host with MySQL Shell we are going to prepare your MySQL Database for the data.

Create database, and table. Download the file [Create Fish Survey](./files/create_fish_survey.sql).

Run the script with:

```
cat create_fish_survey.sql | mysqlsh --sql root@<PRIVATE_IP>
```

## Enable HeatWave

XXX

## Congratulations! You are ready to go to the next Lab!

---

[**<< Go to Lab 1**](../lab1/README.md) | [Home](../README.md) | [**Go to Lab 3 >>>>>**](../lab3/README.md)