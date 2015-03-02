FROM centos:7
MAINTAINER Kevin He <kevin.he@okta.com>
RUN ["curl", "--silent", "-O", "https://<YOUR ORG>.okta.com/static/agents/ProvisioningAgent/OktaProvisioningAgent-<VERSION>.x86_64.rpm"]
# For some reason, the local install was failing if it was on it's own line. Yum fails with rpmdb checksum is invalid.
RUN rpm --rebuilddb; \
	yum localinstall -y OktaProvisioningAgent-<VERSION>.x86_64.rpm; \
	rm OktaProvisioningAgent-<VERSION>.x86_64.rpm;
