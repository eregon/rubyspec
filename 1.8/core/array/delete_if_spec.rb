require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Array#delete_if" do
  before do
    @a = [ "a", "b", "c" ] 
  end

  it "removes each element for which block returns true" do
    @a = [ "a", "b", "c" ] 
    @a.delete_if { |x| x >= "b" }
    @a.should == ["a"]
  end

  it "returns self" do
    @a.delete_if{ true }.equal?(@a).should be_true
  end

  ruby_version_is "" ... "1.8.7" do
    it "raises a LocalJumpError if no block given" do
      lambda { @a.delete_if }.should raise_error(LocalJumpError, /no block given/)
    end
  end

  ruby_version_is "1.8.7" ... "1.9" do
    it "returns an Enumerable::Enumerator if no block given, and the enumerator can modify the original array" do
      enum = @a.delete_if
      enum.should be_kind_of(Enumerable::Enumerator)
      @a.should_not be_empty
      enum.each { true }
      @a.should be_empty
    end
  end

  compliant_on :ruby, :jruby, :ir do
    it "raises a TypeError on a frozen array" do
      lambda { ArraySpecs.frozen_array.delete_if {} }.should raise_error(TypeError)
    end
  end

  it "keeps tainted status" do
    @a.taint
    @a.tainted?.should be_true
    @a.delete_if{ true }
    @a.tainted?.should be_true
  end
end
