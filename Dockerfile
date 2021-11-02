FROM centos
MAINTAINER Idit
ADD /target/*.war /war_file/
CMD ["/bin/bash"]
