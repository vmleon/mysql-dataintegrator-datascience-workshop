# Lab 1: Requirements

![Requirements](./images/requirements.png)

## Create Virtual Cloud Network (VCN)

We are going to create a network with a public subnet (with access from the Internet) and a private subnet (no direct access from the Internet).

This network layout is interesting to protect those services that don't need to be exposed to the Internet (living in the Private subnet) meanwhile other services and virtual machines with direct access from the internet, like Bastion hosts or Web Servers (living in the Public Subnet).

Go to **Menu** > **Networking** > **Virtual Cloud Networks**.

![VCN menu](./images/vcn_menu.png)

> If you have not picked a compartment, pick the **root** compartment for this Lab.
> 
> ![Pick Compartment](./images/pick_compartment.png)

Click **Start VCN Wizard**.

![Start VCN Wizard](./images/start_vcn_wizard.png)

Select **VCN with Internet Connectivity**.

Click **Start VCN Wizard**.

![VCN with Internet](images/vcn_with_internet_connectivity.png)

Change the VCN name and leave everything else as default.

VCN Name: 
```
nature
```

Click **Next**.

![VCN Name](./images/vcn_name.png)

Review all the details and click **Create**.

![VCN Review](./images/vcn_review.png)

The creation process takes few seconds. Confirm everything is created (green tick on all resources) before you continue.

Click **View Virtual Cloud Network**.

![VCN Creation OK](./images/vcn_create_ok.png)

Go to your new **Private Subnet-nature**.

![VCN Private Subnet](./images/vcn_private_subnet.png)

Click **Security List for Private Subnet-nature**.


![VCN Security List](./images/vcn_security_list.png)

We need to open the ports for MySQL and MySQL X protocols: `3306` and `33060`.

Click **Add Ingress Rules**` and fill the form with the following information:

![VCN Add Ingress Rule](images/vcn_add_ingress_rules.png)

We are adding an ingress rule on those ports from the internal VCN CIDR `10.0.0.0/16`.

Source CIDR: 
```
10.0.0.0/16
```

Destination Port Range: 
```
3306,33060
```

Description: 
```
MySQL and MySQL X Protocol
```

Leave the rest of the fields with default values.

And click **Add Ingress Rule** to confirm the values.

![VCN Ingress Rule MySQL](images/vcn_ingress_rule_mysql.png)

You can confirm the rules are added.

![VCN Security List Rules for MySQL](./images/vcn_security_list_for_mysql.png)

---

## Create Bastion Host

We are going to create a compute instance in the Public Subnet with a public IP; it will be our access point to public and private resources.

Go to **Menu** > **Compute** > **Instances**.

![Compute Instance Menu](./images/compute_instance_menu.png)

Click **Create Instance**.

![Create Intance Button](./images/compute_create_instance_button.png)

Change the name to:

```
bastion
```

Make sure the rest of the properties are like the following:

Image: 
```
Oracle Linux 7.9
```

Shape for Always Free: 
```
VM.Standard.E2.1.Micro
```

Alternative Shape cloud be:
```
VM.Standard.E3.Flex
```

Virtual cloud network: 
```
nature
```

Subnet: 
```
Public Subnet-nature
```

Assign a public IPv4 address: 
```
Yes
```

![Instance Values](./images/compute_create_values.png)

On the section Add SSH Keys

Make sure **Generate SSH Keypair** is checked.

Click **Save Private Key** and **Save Public Key**.

After the files are stored on your computer, click **Create**.

![Instance Values](./images/compute_create_ssh.png)

The provisioning takes few minutes.

![Compute Provisioning](./images/compute_provisioning.png)

You can copy the assigned Public IP that we will use to SSH into the instance, also notice that the username is `opc`.

Make sure the Icon turns green, and it says "RUNNING".

![Compute Provisioning](./images/compute_public_ip.png)


To avoid install tools on your local computer, we are going to use Cloud Shell. Cloud Shell is a small and free Linux virtual machine with a lot of DevOps tools preinstalled that Oracle Cloud offers.

Click on the **Cloud Shell** icon on the top-right menu bar.

![Cloud Shell](images/compute_cloud_shell.png)

It will provision this small virtual machine, and you will have access to its terminal from the Oracle Cloud Web Console.

![Cloud Shell terminal](images/cloud_shell.png)

Click on the Cloud Shell **menu** icon and then in **Upload**.

![Cloud Shell terminal](images/cloud_shell_upload.png)

Click on **select from your computer**. And select the private key you downloaded for the compute instance.

![Cloud Shell terminal](images/cloud_shell_select_file.png)

After you Upload the file you can **Hide** the message.

![Cloud Shell terminal](images/cloud_shell_select_file_hide.png)

On Cloud Shell terminal, create `.ssh` folder for your SSH keys.

```
mkdir .ssh
```

Move the key file to your `.ssh` folder with a different name, `id_rsa`, which is a default name.

```
mv ssh-key-*.key .ssh/id_rsa
```

Connect with your bastion host with SSH. The `PUBLIC_IP` was copied when the bastion host was created.

```
ssh opc@PUBLIC_IP
```

To the question `Are you sure you want to continue connecting (yes/no/[fingerprint])?` type `yes` and ENTER.

You will most likely get a `bad permissions` warning. Basically the permissions of the key are too open.

```
Warning: Permanently added 'xxx.xxx.xxx.xxx' (ECDSA) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for '/home/it/.ssh/id_rsa' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "/home/it/.ssh/id_rsa": bad permissions
Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
```

Security first, let's fix the permissions to `600` with the following command:

```
chmod 600 .ssh/id_rsa
```

Connect with SSH again (remember to replace `PUBLIC_IP` with your bastion host IP):

```
ssh opc@PUBLIC_IP
```

This time you should be inside of the bastion host. This is the machine we will use to access MySQL Database System that lives in a private subnet.

Install Docker:

```bash
sudo yum update -y && sudo yum install docker-engine -y
```

Start Docker Engine:

```
sudo systemctl start docker
```

Check it is running:

```
sudo systemctl status docker
```

![Docker Service Active](./images/docker_service_active.png)

If `active`, then enable Docker as a service.

```
sudo systemctl enable docker
```

 Optional, if you don't want to use `sudo` with every `docker` command:
>
> ```
> sudo usermod -aG docker $USER
> ```
> 
> For the changes to take place, you need to `exit` and then `ssh` into the bastion host again

Let's pull MySQL as a docker container:

```
sudo docker pull mysql/mysql-server
```

---

## Create Object Storage and upload files

Go to **Menu** > **Object Storage** > **Object Storage**.

![Object Storage Menu](./images/os_menu.png)

Click **Create Bucket**.

![Create Bucket](./images/os_create_bucket.png)

Change the bucket name, leave everything else by default.

Bucket Name: 

```
bucket-study
```

Click **Create**.

![Bucket Name](./images/os_bucket_name.png)

Click on your new `bucket-study` bucket to see details.

![Create Bucket](./images/os_bucket_study.png)

On the section **Objects**, click **Upload**.

![Create Bucket](./images/os_object_upload.png)

Download the dataset [Reef Life Survey Fish](./files/reef_life_survey_fish.csv).

Drop the file on **Choose Files from your Computer**. Leave everything else by default.

![Object Select File](./images/os_object_select_file.png)

Click **Upload**.

![Object Upload Reef File](./images/os_object_reef_upload.png)

Click **Close**.

You will see the new file in the Objects list. Click on the three dots contextual menu.

![Object List with new File](./images/os_file_uploaded.png)

On the contextual menu, select **View Object Details**.

![Object Details Menu](./images/os_object_details_menu.png)

Take note of the URL you have. We will use it in the following Labs.

![Object Details URL](./images/os_object_details_url.png)

## Congratulations! You are ready to go to the next Lab!

---

[**<< Go to Sign Up**](../lab0/README.md) | [Home](../README.md) | [**Go to Lab 2 >>>>>**](../lab2/README.md)
