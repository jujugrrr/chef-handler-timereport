chef-handler-timereport
=======================

A chef handler generating elapsed time reports. By default it will output the reports to Chef log and generate a CSV file, other format are available.

# Usage

https://docs.getchef.com/handlers.html

Add chef-handler cookbook

```
include_recipe 'chef_handler'
cookbook_file "#{node["chef_handler"]["handler_path"]}/timereport.rb" do
  source 'timereport.rb'
end

chef_handler 'Chef::Handler::TimeReport' do
  source "#{node["chef_handler"]["handler_path"]}/timereport.rb"
  action :enable
end
```

# Example output

```
       [2014-10-15T17:05:49+00:00] INFO: Elapsed time per resource
       [2014-10-15T17:05:49+00:00] INFO: ------------  -------------
       [2014-10-15T17:05:49+00:00] INFO:     2.020827 bash(long_bash)
       [2014-10-15T17:05:49+00:00] INFO:     1.018671 bash(medium_bash)
       [2014-10-15T17:05:49+00:00] INFO:     0.895508 package(bash)
       [2014-10-15T17:05:49+00:00] INFO:     0.150734 cookbook_file(/tmp/kitchen/handlers/timereport.rb)
       [2014-10-15T17:05:49+00:00] INFO:     0.036316 chef_handler(Chef::Handler::TimeReport)
       [2014-10-15T17:05:49+00:00] INFO:     0.006213 yum_globalconfig(/etc/yum.conf)
       [2014-10-15T17:05:49+00:00] INFO:     0.000267 remote_directory(/tmp/kitchen/handlers)
       [2014-10-15T17:05:49+00:00] INFO: Elapsed time per cookbook
       [2014-10-15T17:05:49+00:00] INFO: ------------  -------------
       [2014-10-15T17:05:49+00:00] INFO:     4.122056 handler-project
       [2014-10-15T17:05:49+00:00] INFO:     0.006213 yum
       [2014-10-15T17:05:49+00:00] INFO:     0.000267 chef_handler
       [2014-10-15T17:05:49+00:00] INFO: Elapsed time per recipe
       [2014-10-15T17:05:49+00:00] INFO: ------------  -------------
       [2014-10-15T17:05:49+00:00] INFO:     4.122056 handler-project::default
       [2014-10-15T17:05:49+00:00] INFO:     0.006213 yum::default
       [2014-10-15T17:05:49+00:00] INFO:     0.000267 chef_handler::default
       [2014-10-15T17:05:49+00:00] INFO: CSV report generated : /var/chef/reports/chef-run-report-20141015170549.csv
```

A CSV file will be generated as showed above `CSV report generated : /var/chef/reports/chef-run-report-20141015170549.csv`

```
"Elapsed_time","Resource_name","Resource_type","Source_cookbook","Source_recipe","Source_line"
"2.020827203","long_bash","bash","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:18:in `from_file'"
"1.018671012","medium_bash","bash","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:12:in `from_file'"
"0.89550808","bash","package","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:16:in `from_file'"
"0.150734026","/tmp/kitchen/handlers/timereport.rb","cookbook_file","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:1:in `from_file'"
"0.036315928","Chef::Handler::TimeReport","chef_handler","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:5:in `from_file'"
"0.006213412","/etc/yum.conf","yum_globalconfig","yum","default","/tmp/kitchen/cache/cookbooks/yum/recipes/default.rb:19:in `from_file'"
"0.0002672","/tmp/kitchen/handlers","remote_directory","chef_handler","default","/tmp/kitchen/cache/cookbooks/chef_handler/recipes/default.rb:23:in `from_file'"
```
