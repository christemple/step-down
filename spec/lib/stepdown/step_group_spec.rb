require 'spec_helper'
require 'step_group'
require 'step'

describe Stepdown::StepGroup do

  describe "returning the number of steps that are near the current step" do
    before :each do
      @step_group = Stepdown::StepGroup.new(Stepdown::Step.new(0,/regex/))
    end

    it "should return the steps ordered by use count" do
      @step_group.add_step(Stepdown::Step.new(1,/regex/))
      @step_group.add_step(Stepdown::Step.new(1,/regex/))
      @step_group.add_step(Stepdown::Step.new(3,/regex/))
      @step_group.add_step(Stepdown::Step.new(3,/regex/))
      @step_group.add_step(Stepdown::Step.new(3,/regex/))
      @step_group.add_step(Stepdown::Step.new(2,/regex/))

      @step_group.step_collection[0].count.should == 3
      @step_group.step_collection[1].count.should == 2
      @step_group.step_collection[2].count.should == 1
    end

  end

  describe "updating the use count of the main step" do
    before :each do
      @step_group = Stepdown::StepGroup.new(Stepdown::Step.new(0,/regex/))
    end

    it "should return 0 for an empty group" do
      @step_group.use_count.should be_zero
    end

    it "should return 0 for an empty group" do
      @step_group.update_use_count(10)
      @step_group.use_count.should == 10
    end

  end

end
