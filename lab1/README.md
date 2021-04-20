# Lab 1: Requirements

![Requirements](./images/requirements.png)

## Create Virtual Cloud Network (VCN)

We are going to create a network with a public subnet (with access from Internet) and a private subnet (no direct access from Internet). This layout is interesting to protect those services that don't want to be exposed to Internet from other services or machines that you want to be reachable.

Go to Menu > Networking > Virtual Cloud Networks:

Click **Start VCN Wizard**.

Select **VCN with Internet Connectivity**.

Click **Start VCN Wizard**.

Change the VCN name and leave everything else as default.

> VCN Name: `nature`

Click **Next**.

Review all the details and click **Create**.

The creation process takes few seconds. Confirm everything is created (green tick on all resources) before you continue.

Go to your new `Private Subnet-nature` and click `Security List for Private Subnet-nature`.

Click `Add Ingress Rules` and fill the form with the following information:

> Source CIDR: `10.0.0.0/16`
> 
> Destination Port Range: `3306,33060`
> 
> Description: `MySQL and MySQL X Protocol`

Leave the rest of fields with default values.

## Create Bastion Host

We are going to create a compute in the Public Subnet with a public IP, it will be our access point to public and private resources.

Go to Menu > Compute > Instances.

Click **Create Instance**.

Change the name:

> Name: `bastion`

Make sure the networking is like the following:

> Virtual cloud network: `nature`
>
> Subnet: `Public Subnet-nature (Regional)`
>
> Public IP address: `Assign a public IPv4 address`

On the section Add SSH Keys

Click **Save Private Ke**y or upload your own.

Click **Create**.

The provisioning takes few minutes. You can copy the assigned Public IP that we will use to set up the instance.

Make sure the Icon turn green and it says "RUNNING".

Connect with SSH:

```bash
ssh -i ./path/to/private_key opc@<PUBLIC_IP>
```

To the question `Are you sure you want to continue connecting (yes/no/[fingerprint])?` type `yes` and ENTER.

Install Docker:

```bash
sudo yum update -y && sudo yum install docker-engine -y
```

Start Docker Engine:

`sudo systemctl start docker`

Check it is running:

`sudo systemctl status docker`

If `active` then enable Docker as service 
`sudo systemctl enable docker`

> Optional, if you don't want to use sudo with every `docker` command:
>
> `sudo usermod -aG docker $USER`

Let's pull and run Mysql Shell as a docker container:

`sudo docker pull mysql/mysql-server`

`sudo docker run -it --rm --name mysql mysql/mysql-server bash`

When in the docker container, type `mysqlsh`

We will use the bastion host and `mysqlsh` on Lab 2.

## Create Object Storage and upload files

Go to Menu > Object Storage > Object Storage.

Click **Create Bucket**.

Change the bucket name, leave everything else by default.

> Bucket Name: `bucket-study`

Click **Create**.

Click on `bucket-study` new bucket to see details.

On the section **Objects** click **Upload**.

Download the dataset [Reef Life Survey Fish](./files/reef_life_survey_fish.csv)

Drop the file on **Choose Files from your Computer**. Leave everything else by default.

Click **Upload**.

## Congratulations! You are ready to go to the next Lab!

---

[**<< Go to Sign Up**](../lab0/README.md) | [Home](../README.md) | [**Go to Lab 2 >>>>>**](../lab2/README.md)