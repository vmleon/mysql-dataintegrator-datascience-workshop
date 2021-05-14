# Next Steps

## Want to learn more?

[Getting Started with Data Integration](https://docs.oracle.com/en-us/iaas/data-integration/using/preparing-for-connectivity.htm)

## Troubleshooting

---

Lab 2: Running MySQL docker image:

```
docker: Error response from daemon: Conflict. The container name "/mysql" is already in use by container "jhgjhg453j45hg3jh45g3j4h5gj34hg5j34hg5jh34g5jh34gj534". You have to remove (or rename) that container to be able to reuse that name.
```

>Note: Run the following command and try again
> 
> `sudo docker stop mysql`

---

Lab 2: Enable HeatWave:

Error: `attribute = {heatWaveCluster.shapeFamily}, value = {MySQL.HeatWave.VM.Standard.E3} - for this cluster shape the MySQL instance shape must be the same`

![](images/heatwave_error_shape.png)

>Note: You need to use HeatWave Shape when you created MySQL Database System.
> 
> Terminate your current MySQL Instance and create a new one with HeatWave valid shape, for example: `MySQL.HeatWave.VM.Standard.E3`.
> 
> Enable HeatWave should work with the new shape.

---

Lab 3: Creating Data Flow.

`java.io.IOException: Unable to determine if path is a directory`

>Note: Review Policy:
> 
> `allow any-user to read objectstorage-namespaces at tenancy`

---

Lab 3: Creating Data Integration Workshop

![Data Integration VNC policy missing](images/di_error_vcn.png.png)

```
Following VCN not found or user not authorized: ocid1.vcn.oc1.uk-london-1.aaaaasdlnsdfjnskjgndfkjbdkjfgbdkjfbgdjkf ,or there might be missing network policies, please refer this link for more information https://docs.cloud.oracle.com/en-us/iaas/data-integration/using/
```

You forgot to create the policy for Data Integration to use Virtual Cloud Network.

```
allow service dataintegration to use virtual-network-family in tenancy
```

---

[**<< Go to Lab 5**](../lab5/README.md) | [Home](../README.md)