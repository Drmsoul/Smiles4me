require 'spec_helper'
require 'shared_examples/controller_shared_examples'

describe SorceryController, :mongoid => true do

  it_should_behave_like "sorcery_controller"
  
end
