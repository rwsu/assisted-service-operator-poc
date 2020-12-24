set -eux

make docker-build docker-push IMG=quay.io/rwsu/assisted-service-operator:latest

# Install the AssistedService CRD
make install

# Deploy operator
export IMG=quay.io/rwsu/assisted-service-operator:latest
make deploy

# create AssistedService resource
oc apply -f config/samples/namespace.yaml
oc apply -f config/samples/default_role.yaml
oc apply -f config/samples/assisted-service_v1beta1_assistedservice.yaml 

# after service is up
# oc expose service -n assisted-installer assisted-service
# oc expose service -n assisted-installer ocp-metal-ui
# oc get routes -n assisted-installer