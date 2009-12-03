require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Hamster::List do

  [:reduce, :inject].each do |method|

    describe "##{method}" do

      [
        [[], "@"],
        [["A"], "@a"],
        [["A", "B", "C"], "@abc"],
      ].each do |values, result|

        describe "on #{values.inspect}" do

          list = Hamster.list(*values)

          describe "with a block" do

            it "returns #{result.inspect}" do
              list.send(method, "@") { |memo, item| memo << item.downcase }.should == result
            end

          end

          describe "without a block" do

            it "returns the memo" do
              list.send(method, "@").should == "@"
            end

          end

        end

      end

    end

  end

end
