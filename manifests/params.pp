# Class: nginx::params
#
# This module manages NGINX paramaters
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class nginx::params {
  $nx_temp_dir                = '/tmp'
  $nx_run_dir                 = '/var/nginx'

  $nx_conf_dir                = '/etc/nginx'
  $nx_worker_processes        = 1
  $nx_worker_connections      = 1024
  $nx_multi_accept            = off
  $nx_sendfile                = on
  $nx_client_body_timeout     = 10
  $nx_client_header_timeout   = 10
  $nx_keepalive_timeout       = 20
  $nx_send_timeout            = 10


  $nx_tcp_nopush              = on
  $nx_tcp_nodelay             = off
  $nx_gzip                    = on
  $nx_gzip_comp_level         = 1
  $nx_gzip_http_version       = '1.1'
  $nx_gzip_proxied            = 'any'
  $nx_gzip_static             = on
  $nx_gzip_types              = [
                                  'text/plain',
                                  'text/css',
                                  'text/javascript',
                                  'application/x-javascript',
                                  'application/json',
                                  'text/xml',
                                  'application/atom+xml',
                                  'text/comma-separated-values',
                                  'application/vnd.ms-fontobject',
                                  'application/x-font-ttf',
                                  'font/opentype',
                                  'application/x-font-woff',
                                ]
  $nx_gzip_min_length         = 1400
  $nx_gzip_buffers            = '16 8k'
  $nx_gzip_vary               = on

  # Security
  $nx_server_tokens           = off

  $nx_proxy_redirect          = off
  $nx_proxy_set_header        = [
                                  'Host $host',
                                  'X-Real-IP $remote_addr',
                                  'X-Forwarded-For $proxy_add_x_forwarded_for',
                                  'X-SSL-CERTIFICATE $ssl_client_cert'
                                ]
  $nx_proxy_hide_header       = ['HTTPS', 'X-Client-Verify.*']
  $nx_proxy_set_https_header  = ['Host $host', 'HTTPS https']

  $nx_client_body_temp_path   = "${nx_run_dir}/client_body_temp"
  $nx_client_body_buffer_size = '128k'
  $nx_client_max_body_size    = '1G'
  $nx_proxy_temp_path         = "${nx_run_dir}/proxy_temp"
  $nx_proxy_connect_timeout   = '90'
  $nx_proxy_send_timeout      = '90'
  $nx_proxy_read_timeout      = '90'
  $nx_proxy_buffers           = '32 4k'

  $nx_logdir = $::kernel ? {
    /(?i-mx:linux)/ => '/var/log/nginx',
  }

  $nx_pid = $::kernel ? {
    /(?i-mx:linux)/  => '/var/run/nginx.pid',
  }

  $nx_daemon_user = $::operatingsystem ? {
    /(?i-mx:debian|ubuntu)/                    => 'www-data',
    /(?i-mx:fedora|rhel|centos|suse|opensuse)/ => 'nginx',
  }
}
