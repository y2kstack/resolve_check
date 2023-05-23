# resolve_check


You are correct that on Linux, when the /etc/resolv.conf file changes, 
it may be necessary to call res_init() to reload the resolver information. However, 
the Resolv library in Ruby does not provide a direct method to call res_init().
