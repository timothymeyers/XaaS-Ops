#!/usr/bin/bash

NO=$1

echo $NO

az group delete -n workload-rg-workload-mlz --yes --no-wait \
&& az group delete -n tmlz$NO-rg-sharedServices-mlz --yes --no-wait \
&& az group delete -n tmlz$NO-rg-operations-mlz --yes --no-wait  \
&& az group delete -n tmlz$NO-rg-identity-mlz --yes --no-wait  \
&& az group delete -n tmlz$NO-rg-hub-mlz --yes --no-wait  \
&& az deployment sub delete -n workload-rg-workload-mlz \
&& az deployment sub delete -n hub-to-workload-vnet-peering \
&& az deployment sub delete -n workload-to-hub-vnet-peering \
&& az monitor diagnostic-settings subscription delete \
  -n log-hub-sub-activity-to-tmlz$NO-log-operations-mlz --yes



