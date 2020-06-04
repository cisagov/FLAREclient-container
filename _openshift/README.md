# Openshift Applier
This directory contains files used to deploy Human Review using the openshift applier.
https://github.com/redhat-cop/openshift-applier. The steps must be taken to deploy
FLAREcloud as well:

### Service Accounts
- Add the `database-scc` security context constraints to the `database-sa` service account: 
`oc adm policy add-scc-to-user database-scc -z database-sa -n <namespace>`
- Note: to create the above `scc` and `serviceAccount` manually:
    - `oc process -f scc-database.yaml | oc create -f -`
    - `oc process -f sa-database.yaml | oc create -f -`

### Secrets
- `artifactory` - This will be used by the `BuildConfig` to push artifacts.
- `artifactory-puller` -  This will be used by the `BuildConfig` to pull artifacts.