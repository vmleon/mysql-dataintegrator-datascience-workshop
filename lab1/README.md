# Lab 1: Create Data Integrator instance

![Data Ingegrator](./images/ocidi_banner.jpeg)

This lab walks you through the steps to get started using **Data Integrator** on Oracle Cloud Infrastructure (OCI). You will provision a new instance in just few minutes.

Oracle Cloud Infrastructure Data Integration is a fully managed, serverless, native cloud service that helps you with common extract, load, and transform (ETL) tasks such as ingesting data from different sources, cleansing, transforming, and reshaping that data, and then efficiently loading it to target data sources on Oracle Cloud Infrastructure.

| Role           | Responsibilities                                                                       |
| -------------- | -------------------------------------------------------------------------------------- |
| Administrators | Oversee, manage and monitor lifecycle management and security policies for the service |
| Data Engineers | Develop, build and test data integration solutions                                     |
| Operators      | Manage, monitor, and diagnose data integration executions                              |

## Create Your OCI Data Integrator instance

[Getting Started with Data Integration](https://docs.oracle.com/en-us/iaas/data-integration/using/preparing-for-connectivity.htm)

Requirements

VCN

If not administrator:

```
allow group <group-name> to inspect compartments in tenancy
allow service dataintegration to use virtual-network-family in compartment <your_compartment>
```

Non-admin users
```
allow group <group-name> to manage dis-workspaces in compartment <compartment-name>
allow group <group-name> to manage dis-work-requests in compartment <compartment-name>
allow group <group-name> to use virtual-network-family in compartment <compartment-name>
allow group <group-name> to manage tag-namespaces in compartment <compartment-name>
```

To use Object Storage
```
allow group <group_name> to use object-family in compartment <compartment-name>
allow any-user to use buckets in compartment <compartment-name> where ALL {request.principal.type='disworkspace', request.principal.id='<workspace_ocid>'}
allow any-user to manage objects in compartment <compartment-name> where ALL {request.principal.type='disworkspace',request.principal.id='<workspace_ocid>'}
```

To Use ADB
```
allow any-user {PAR_MANAGE} in compartment <compartment-name> where ALL {request.principal.type='disworkspace', request.principal.id='<workspace_ocid>'}
```

> Data Integration Service should have network access to the sources and targe

Go to Menu > Data Integration.

Click **Create Workspace**.

Workspace name. Select VCN and Public Subnet

Wait for provisioning. (~9min)

## Create the source of data

You can select different sources for the data. Different types of databases are supported, but for simplicity we are going to upload two files to Object Storage.

### Create a Bucket

Menu > Object Storage > Object Storage

Click **Create Bucket**.

> Bucket Name: Source
> Storage Tier: Standard

Click **Create**.

### Upload files

Click **Upload** on the Objects section.

Click the link **select files**.

Select `titanic.csv` from your file system.

Click **Upload**.

XXX Second file

## Create the pipeline

Get back to Data Integration and click on the workspace created.

Click **Create Data Assets**

> Name: `titanic`
> Identifier: `titanic`
> Type: `Oracle Object Storage`

Data **Flow**

Data Integration offers you two types of **tasks**:
- Integration
- Data Loader.

Publish to your **Application**.

## It works

XXX.

## Congratulations, you are ready for the next Lab!

---

[**<< Go to Sign Up**](../lab0/README.md) | [Home](../README.md) | [**Go to Lab 2 >>>>>**](../lab2/README.md)
