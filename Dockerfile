FROM dvcorg/cml

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \  
    apt update && \
    apt install -y r-base && \
    R --silent -e "install.packages(c(\"igraph\", \"ppcor\", \"scales\", \"Rcpp\"))" && \
    wget -c https://github.com/miicTeam/miic_R_package/archive/v1.4.2.tar.gz && \
    tar -xvzf v1.4.2.tar.gz && \
    R CMD INSTALL miic_R_package-1.4.2/. --preclean
