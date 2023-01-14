#!/bin/bash

# we need to build our image which will look something like the following

#
# docker build ./Dockerfile 
#

# now we push our image to linode images

#
# linode-cli image-upload --label "kevsite-production" --description "production image for kevsite" --region us-west FILE
#

# now we need to tell our linode instance to rebuild from the image on dockerhub

#
# linode-cli linodes rebuild [-h] [--image image] [--root_pass [ROOT_PASS]] [--authorized_keys authorized_keys] [--authorized_users authorized_users]
#                                 [--stackscript_id stackscript_id] [--stackscript_data stackscript_data] [--booted booted]
#                                 linodeId
#

# it will likely look more like this

# docker build --file=./Dockerfile | linode-cli image-upload --label "kevsite-production" ... -
# linode cli linodes rebuild --image=label="kevsite-production" ... linodeId