# require 'spec_helper'
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', '..', '..', 'lib', 'attack')

require 'domain'
require 'pp'
require 'awesome_print'

describe Attack::Domain do
  
  context '[+] Initial Tests' do
    it '[-] has a version number' do
      expect(Attack::Domain::VERSION).not_to be nil
    end
    
    it '[-] ' do
      
    end
    
  end
  
  describe Attack::Domain::Core do
    
    before(:context) do
      @core  = Attack::Domain::Core.new
      @domain1   = 'wikipedia.org'
      @domain2   = 'rubyfu.net'
      @domain3   = 'techarch.com.sa'
      @domain4   = 'zonetransfer.me'
      @ptr_ip1   = '91.198.174.192'     # wikipedia.org
      @ptr_ip2   = '207.46.197.32'      # Very Long PTR (owa.zonetransfer.me)
      @ptr_ip3   = '191.239.213.197'    # No PTR
    end
    
    context '[+] Methods Tests' do
      
      it '[-] Can #get_records_objects' do
        @records_objects = @core.get_records_objects(@domain1)
        # pp records_objects
        expect(@records_objects).to be_a(Hash)
      end

      it '[-] Can #get_domainname' do
        @core.get_records_objects(@domain1)
        expect(@core.get_domainname).to match_array ["ns0.wikimedia.org", "ns1.wikimedia.org", "ns2.wikimedia.org"]
      end
      
      it '[-] has #get_domainname aliases' do
        expect(@core.get_domainnams).to match_array ["ns0.wikimedia.org", "ns1.wikimedia.org", "ns2.wikimedia.org"]
        expect(@core.domainnames).to match_array ["ns0.wikimedia.org", "ns1.wikimedia.org", "ns2.wikimedia.org"]
      end
      
      it '[-] Can #get_ptr from an IP' do
        expect(@core.get_ptr(@ptr_ip1)).to match_array ["text-lb.esams.wikimedia.org"]
      end
      
      it '[-] Can #get_ptr from a domain' do
        expect(@core.get_ptr(@domain2)).to match_array ["www.gitbooks.io", "toyama-8522.herokussl.com", "elb072082-1780125795.us-east-1.elb.amazonaws.com"]
      end

      it '[-] Can #get_ptr know if no PTR (return nil)' do
        expect(@core.get_ptr(@ptr_ip3)).to be_nil
      end

      it '[-] Can #get_zone_transfer' do
        expect(@core.get_zone_transfer(@domain4)).to be_an Array
      end

      it '[-] has #get_zone_transfer aliases' do
        expect(@core.zone_transfer(@domain4)).to be_an Array
      end
      
      it '[-] Can #get_zone_transfer know if no zone transfer (return nil)' do
        @core.get_records_objects(@domain2)
        expect(@core.zone_transfer(@domain2)).to be_nil
      end

    end
    
  end
  
end
