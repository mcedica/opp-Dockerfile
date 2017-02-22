FROM centos:7
MAINTAINER Kevin He <kevin.he@okta.com>
RUN ["curl", "--silent", "-O", "https://nuxeoio-admin.okta.com/static/agents/ProvisioningAgent/OktaProvisioningAgent-01.00.12.x86_64.rpm"]
# For some reason, the local install was failing if it was on it's own line. Yum fails with rpmdb checksum is invalid.
RUN rpm --rebuilddb; \
	yum localinstall -y OktaProvisioningAgent-01.00.12.x86_64.rpm; \
	rm OktaProvisioningAgent-01.00.12.x86_64.rpm;
USER root
ENTRYPOINT ["/opt/OktaProvisioningAgent/configure_agent.sh"]
USER 1001
