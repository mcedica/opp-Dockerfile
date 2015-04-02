## LDAP
The Dockerfile just downloads the agent RPM to a centos 7 container and installs it. 

### Steps:
1. Clone this repo.
2. Change the \<VERSION\> and \<YOUR ORG\> in the docker file. You can get the version number by navigating to Settings->Downloads in the Okta Admin dashboard. You can download the Okta Provisioning Agent (x64 RPM) file or just hover over the button to get the version number.
3. Build the image.

	```Shell
		docker build -t someUser/centos:agent .
	```

4. Start a container.

	```Shell
		docker run -t -i --name agent_1 someUser/centos:agent /bin/bash
		
		or
		
		docker run -i -t --name agent_1 --add-host="dockerhost:<IP-Address>" someUser/centos:agent /bin/bash
		To add an entry to the container's hosts file. Make sure that you have the latest version of Docker installed, some package managers don't keep their version up to date.
		
		or 
		
		docker run -i -t --name agent_1 --hostname="test" centos:agent /bin/bash
		So the On-Premises Agent name won't be gibberish in Okta.
	```

	- Note: You can detach from a running container with ctrl-p + ctrl-q.
5. Run the setup script for the Okta Provisioning Agent.

	```Shell
		/opt/OktaProvisioningAgent/configure_agent.sh
	```

	Note: More detailed instructions on setting up the Agent can be found here: https://github.com/OktaIT/opp-ldap
