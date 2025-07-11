#!/bin/bash

set -x
set -o nounset
set -o errexit
set -o pipefail

echo "************  assisted ofcir baremetal heterogeneous teardown command ************"

# TODO: Remove once OpenShift CI supports it out of the box (see https://access.redhat.com/articles/4859371)
fix_uid.sh

cd "${ANSIBLE_PLAYBOOK_DIRECTORY}"
ansible-playbook --extra-vars "@vars/ci.yml" \
                 --extra-vars "@vars/ci_ofcir_heterogeneous_infrastructure.yml" \
                 --extra-vars "${ANSIBLE_EXTRA_VARS}" \
                 "${ANSIBLE_PLAYBOOK_DESTROY_INFRA}"
