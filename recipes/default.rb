#
# Cookbook Name:: omnigollum-site-cookbook
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "omnigollum_site::user"
include_recipe "omnigollum_site::rbenv"
include_recipe "omnigollum_site::omnigollum_site"
include_recipe "omnigollum_site::unicorn"
include_recipe "omnigollum_site::nginx"
