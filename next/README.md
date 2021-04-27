# Next Steps

## Want to learn more?

[Getting Started with Data Integration](https://docs.oracle.com/en-us/iaas/data-integration/using/preparing-for-connectivity.htm)

## Troubleshooting

---
Lab 2: Running MySQL docker image:

```
docker: Error response from daemon: Conflict. The container name "/mysql" is already in use by container "jhgjhg453j45hg3jh45g3j4h5gj34hg5j34hg5jh34g5jh34gj534". You have to remove (or rename) that container to be able to reuse that name.
```

> Run the following command and try again
> 
> `sudo docker stop mysql`

---

Lab 3: Creating Data Flow.

`java.io.IOException: Unable to determine if path is a directory`

> Review Policy:
> 
> `allow any-user to read objectstorage-namespaces at tenancy`

---

Lab 3: Creating Data Integration Workshop

![Data Integration VNC policy missing](images/di_error_vcn.png.png)

```
Following VCN not found or user not authorized: ocid1.vcn.oc1.uk-london-1.aaaaasdlnsdfjnskjgndfkjbdkjfgbdkjfbgdjkf ,or there might be missing network policies, please refer this link for more information https://docs.cloud.oracle.com/en-us/iaas/data-integration/using/
```

You forgot to create the policy for Data Integration to use Virtual Cloud Network

```
allow service dataintegration to use virtual-network-family in tenancy
```

---

[**<< Go to Lab 5**](../lab5/README.md) | [Home](../README.md)