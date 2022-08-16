#
# Cookbook:: udemy_demo
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe "udemy_demo::webserver"
include_recipe "udemy_demo::content"
include_recipe "udemy_demo::_python_build"
