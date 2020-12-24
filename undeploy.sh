oc delete roles  -n assisted-installer default
oc delete clusterrolebinding default
oc delete assistedservice -n assisted-installer assistedservice-sample
make undeploy