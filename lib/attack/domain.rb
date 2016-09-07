
# External dependencies
require 'dnsruby'

# Internal dependencies
require 'attack/domain/version'
require 'attack/domain/core'

module Attack
  module Domain
    #...
  end
end


# https://github.com/evilsocket/bettercap/blob/master/lib/bettercap.rb
def attack_domain_autoload(path = '')
  dir   = File.direname(__FILE__) + "domain/#{path}"
  deps  = []
  files = []

  Dir[dir + "**/*.rb"].each do |filename|
    require filename.gsub(dir, '').gsub('.rb', '')
  end
end

