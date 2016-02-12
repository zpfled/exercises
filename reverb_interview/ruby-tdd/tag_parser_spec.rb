require "rspec"
require_relative "tag_parser"

describe TagParser do
  let(:tags) { "foo, bar, condition:Brand New, foo:bar, my tag, model: American Stratocaster, make:Fender, somethingElse"}

  let(:parser) {
    described_class.new(tags)
  }

  it "parses make" do
    parser.make.should == "Fender"
  end

  it "parses model" do
    parser.model.should == "American Stratocaster"
  end

  it "parses condition" do
    parser.condition.should == "Brand New"
  end
end
