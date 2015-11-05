require 'spec_helper'
describe 'surf' do

  context 'with defaults for all parameters' do
    it { should contain_class('surf') }
  end
end
