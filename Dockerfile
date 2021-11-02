FROM centos:01
MAINTAINER Idit
ADD /target/*.war /war_file/
CMD ["/bin/bash"]
