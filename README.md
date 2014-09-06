# Development LAMP stack with PHP 5.4 #

When build you will have a full LAMP stack with PHP 5.4 (dotdeb.org). This image is a complete development environment with all necessary extensions.

This LAMP stack provides support for multiple vhosts as explained in the prerequisites.

# Prerequisites #

As most developers I work on multiple projects/apps each having their own vhost name. I got used to use a logical domain name when working on such projects. This Docker image is thus based on a fixed structure for your projects.

Upon running this stack will try and find vhost configurations (see: running, on how to map your directories) and enable them in apache automatically for you. 

Example accepted site structure:
    
    sites /
            myexcellent.domain /
                    conf /
                        myexcellent.domain.conf
                    public_html /
                        ....
                        web (optional) /
                    logs (optional) /
                        error.log
                        access.log

In this example __myexcellent.domain.conf__ consists of:

    <VirtualHost *:80>
        DocumentRoot "/sites/myexcellent.domain/public_html/web"
        ServerAdmin yourname@localhost
        ServerName myexcellent.domain.dev
        <Directory "/sites/myexcellent.domain/public_html/web">
            AllowOverride All
            SetEnv APPLICATION_ENV dev
        </Directory>
        ErrorLog /sites/myexcellent.domain/logs/error.log
        CustomLog /sites/myexcellent.domain/logs/access.log common
    </VirtualHost>

As you can see I use __.dev__ as my local domain suffix. As a tip I would recommend setting up dnsmasq to resolve these subdomains to your dev machine. When you are not able to install or setup dnsmasq you will have to alter your local /etc/hosts file to resolve these domains. E.g.:

    127.0.0.1     myexcellent.domain.dev

# Building #

Building is simple just use:
    
    docker build --tag=yourname/dev-lamp  .

# Running #

To make all of this work properly make sure you run this docker image as follows:

    docker run --name="web" -v ~/sites:/sites -d -p 80:80 yourname/dev-lamp

Where ~/sites is your local folder providing a strucure as explained in the prerequisites. Obiously running this image on port 80 requires you to have nothing running on that port. :-)

# Additional Files #

Upon build all additional files are copied/installed. Feel free to alter these. When you have great ideas make sure you share... \m/

# Note on mysql #

This is installed, but further configuration still needs to be done. I want to make sure you can mount a local folder for your mysql data.