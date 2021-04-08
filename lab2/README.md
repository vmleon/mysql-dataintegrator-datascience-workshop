# Lab 2: Create MySQL Database Service

![MySQL Database Service](./images/mds_banner.png)

**MySQL Database Service** XXX.

Requirements

VCN

## Create an instance of MySQL in the cloud

Go to Menu > MySQL > DB Systems.

Click **Create MySQL DB System**.

Make sure your root compartment (or the one you want) is selected.

Name your MySQL instance

> Name: `mysql-analytics`
> Description (optional): `MySQL instance for Analytics`

Between the three options, pick `HeatWave`. `Standalone` will work for the test but it doesn't include the Analytics Engine.

For Username and password

> Username: `root`
> Password: `R2d2&C3pO!`
> ConfirmPassword: `R2d2&C3pO!`

Network configuration:

> Virtual Cloud Network: `demo`
> Subnet: `Private Subnet-demo (Regional)`

Everything else is good by default:

> Configure placement: `AD-1`
> Configure hardware: `MySQL.VM.Standard.E3.1.8GB` or `xxx` for HeatWave (selected above)
> Data Storage Size (GB): `50`
> Configure Backups: `Enable Automatic Backups`

Click **Create**.

The provisioning is around 10 minutes. The icon should change to `ACTIVE`:

![Provisioning](./images/mds-provisioning.png)

![Active](./images/mds-active.png)

## Connect and create DB

Create user.

XXX

Create database.

```
session.createSchema("titanic")
```

```
cat create_passenger_table.sql | mysqlsh --sql root@10.0.1.64
```

Create table

XXX

## Take note of some data

Copy the private IP of the instance.

XXX

## Enable HeatWave

XXX

## Congratulations! You are ready to go to the next Lab!

---

[**<< Go to Lab 1**](../lab1/README.md) | [Home](../README.md) | [**Go to Lab 3 >>>>>**](../lab3/README.md)