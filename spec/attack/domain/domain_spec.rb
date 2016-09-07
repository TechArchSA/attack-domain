# require 'spec_helper'
p require '../../attack/domain/core.rb'

describe Attack::Domain do
  
  before do
    
  end

  context 'Initial tests' do
    it 'has a version number' do
      expect(Attack::Domain::VERSION).not_to be nil
    end
  end
  
  describe '#info' do
    context 'Test all given domain information' do
      
      it 'Test IP address(es)' do

      end
      
      it 'All available records' do

      end

    end
    
  end
end


















