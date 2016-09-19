

#
# Path Setup
#
$LOAD_PATH.unshift(File.join(Dir.pwd, '..', '..','lib'))[0]


module Attack
  module Domain
    
    # https://github.com/evilsocket/bettercap/blob/master/lib/bettercap.rb
    #
    # Load all dependencies
    #
    def self.autoload
  
      # External dependencies
      require 'dnsruby'
      require 'whois'

      # Internal dependencies
      files   = Dir.glob("#{Dir.pwd}/domain/*.rb")
      files.each do |filename|
        require filename.gsub('.rb', '')
        p filename
      end
    
    end
  end
end
Attack::Domain.autoload

