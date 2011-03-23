require 'spec_helper'
require 'scenario'
require 'step'


describe Stepdown::Scenario do
  before :each do
    @scenario = Stepdown::Scenario.new
    @s1 = Stepdown::Step.new(1, /step 1/)
    @s2 = Stepdown::Step.new(2, /Step 2/)
    @s2_dup = Stepdown::Step.new(2, /Step 2/)
    @s3 = Stepdown::Step.new(3, /Step 3/)

  end

  describe "adding steps" do
    it "should add steps to cache" do
      @scenario.add_step(@s1)
      @scenario.add_step(@s2)
      @scenario.add_step(@s2_dup)
      @scenario.add_step(@s3)

      steps = [@s1, @s2, @s3]
      @scenario.steps.should =~ steps
    end

  end

  describe "returning unique steps" do 
    it "should only return one instance of each step" do
      @scenario.add_step(@s1)
      @scenario.add_step(@s2)
      @scenario.add_step(@s2_dup)
      @scenario.add_step(@s3)

      steps = [@s1, @s2, @s3]
      @scenario.uniq_steps.should =~ steps
    end

  end

end

