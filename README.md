chef-handler-timereport
=======================

A chef handler generating elapsed time reports. By default it will output the reports to Chef log and generate a CSV file, other format are available.

# Usage

https://docs.getchef.com/handlers.html

Add chef-handler cookbook

```
include_recipe 'chef_handler'
# Install `chef-handler-timereport` gem during the compile phase
chef_gem "chef-handler-timereport"

# load the gem here so it gets added to the $LOAD_PATH, otherwise chef_handler
# will fail.
require 'chef/handler/timereport'

chef_handler 'Chef::Handler::TimeReport' do
  source "#{node["chef_handler"]["handler_path"]}/timereport.rb"
  action :nothing
end.run_action(:enable)
```

# Options

You can pass a `format` argument to specify which kind of report you want (only CSV is supported for now), default to CSV.

chef_handler 'Chef::Handler::TimeReport' do
  source "#{node["chef_handler"]["handler_path"]}/timereport.rb"
  action :nothing
  arguments :format => 'csv'
end.run_action(:enable)

# Example output

```
       [2014-10-17T12:46:50+00:00] INFO: Elapsed time total
       [2014-10-17T12:46:50+00:00] INFO: ------------  -------------
       [2014-10-17T12:46:50+00:00] INFO:     4.392641 Total run
       [2014-10-17T12:46:50+00:00] INFO:     3.982231 Total spent in resources
       [2014-10-17T12:46:50+00:00] INFO:     0.410410 Total spend in retrieving/compilation
       [2014-10-17T12:46:50+00:00] INFO: Elapsed time per resource
       [2014-10-17T12:46:50+00:00] INFO: ------------  -------------
       [2014-10-17T12:46:50+00:00] INFO:     2.019013 bash(long_bash)
       [2014-10-17T12:46:50+00:00] INFO:     1.018112 bash(medium_bash)
       [2014-10-17T12:46:50+00:00] INFO:     0.913099 package(bash)
       [2014-10-17T12:46:50+00:00] INFO:     0.024158 chef_handler(Chef::Handler::TimeReport)
       [2014-10-17T12:46:50+00:00] INFO:     0.006746 yum_globalconfig(/etc/yum.conf)
       [2014-10-17T12:46:50+00:00] INFO:     0.000863 cookbook_file(/tmp/kitchen/handlers/timereport.rb)
       [2014-10-17T12:46:50+00:00] INFO:     0.000240 remote_directory(/tmp/kitchen/handlers)
       [2014-10-17T12:46:50+00:00] INFO: Elapsed time per cookbook
       [2014-10-17T12:46:50+00:00] INFO: ------------  -------------
       [2014-10-17T12:46:50+00:00] INFO:     3.975245 handler-project
       [2014-10-17T12:46:50+00:00] INFO:     0.006746 yum
       [2014-10-17T12:46:50+00:00] INFO:     0.000240 chef_handler
       [2014-10-17T12:46:50+00:00] INFO: Elapsed time per recipe
       [2014-10-17T12:46:50+00:00] INFO: ------------  -------------
       [2014-10-17T12:46:50+00:00] INFO:     3.975245 handler-project::default
       [2014-10-17T12:46:50+00:00] INFO:     0.006746 yum::default
       [2014-10-17T12:46:50+00:00] INFO:     0.000240 chef_handler::default
       [2014-10-17T12:46:50+00:00] INFO: CSV report generated : /var/chef/reports/chef-run-report-20141017124650.csv
```

A CSV file will be generated as showed above `CSV report generated : /var/chef/reports/chef-run-report- 20141017124650.csv`

```
"Total"
"Elapsed_time","Type"
"4.392640755","Total time run"
"3.982231087","Total time in resources"
"0.4104096680000002","Total time on retrieving/solving dependency"
"Resources"
"Elapsed_time","Resource_name","Source_cookbook","Source_recipe","Source_line"
"2.019013276","bash(long_bash)","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:19:in `from_file'"
"1.018111737","bash(medium_bash)","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:13:in `from_file'"
"0.913098995","package(bash)","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:17:in `from_file'"
"0.02415772","chef_handler(Chef::Handler::TimeReport)","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:5:in `from_file'"
"0.006745829","yum_globalconfig(/etc/yum.conf)","yum","default","/tmp/kitchen/cache/cookbooks/yum/recipes/default.rb:19:in `from_file'"
"0.000863085","cookbook_file(/tmp/kitchen/handlers/timereport.rb)","handler-project","default","/tmp/kitchen/cache/cookbooks/handler-project/recipes/default.rb:1:in `from_file'"
"0.000240445","remote_directory(/tmp/kitchen/handlers)","chef_handler","default","/tmp/kitchen/cache/cookbooks/chef_handler/recipes/default.rb:23:in `from_file'"
"Cookbooks"
"Name","Elapsed_time"
"3.9752448129999998","handler-project"
"0.006745829","yum"
"0.000240445","chef_handler"
"Recipes"
"Name","Elapsed_time"
"3.9752448129999998","handler-project::default"
"0.006745829","yum::default"
"0.000240445","chef_handler::default"
```
