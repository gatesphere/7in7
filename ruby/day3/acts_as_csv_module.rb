module ActsAsCsv
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
      include Enumerable
    end
  end
  
  module InstanceMethods
  
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
    
    def each
      @csv_contents.each(&block)
    end  
    
  end
  
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  def method_missing name, *args
    key = name.to_s
    idx = csv.headers.index(key)
    self[idx]
  end
end

csv = RubyCsv.new
csv.each {|row| puts one}
