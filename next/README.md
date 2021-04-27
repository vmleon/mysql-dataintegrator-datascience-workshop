# Next Steps

## Want to learn more?

[Getting Started with Data Integration](https://docs.oracle.com/en-us/iaas/data-integration/using/preparing-for-connectivity.htm)

## Troubleshooting

---

Lab 3: Creating Data Flow.

`java.io.IOException: Unable to determine if path is a directory`

> Review Policy:
> 
> `allow any-user to read objectstorage-namespaces at tenancy`

---

Lab 3: Creating Data Integration Workshop

![Data Integration VNC policy missing](./images/../imgaes/di_error_vcn.png.png)

```
Following VCN not found or user not authorized: ocid1.vcn.oc1.uk-london-1.aaaaasdlnsdfjnskjgndfkjbdkjfgbdkjfbgdjkf ,or there might be missing network policies, please refer this link for more information https://docs.cloud.oracle.com/en-us/iaas/data-integration/using/
```

You forgot to create the policy for Data Integration to use Virtual Cloud Network

```
allow service dataintegration to use virtual-network-family in tenancy
```

---

[**<< Go to Lab 5**](../lab5/README.md) | [Home](../README.md)