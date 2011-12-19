module ActsAsCsv
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
  
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents.push(CsvRow.new(row.chomp.split(', '), @headers))
      end
    end
    
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
    
    def each(&block)
      @csv_contents.each do |row|
        block.call row
      end
    end  
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  def method_missing name, *args
    idx = @headers.index(name.to_s)
    
    if idx.nil?
      nil
    else
      @row[idx]
    end
  end
    
  attr_accessor :row
  
  def initialize(row_array, headers)
    @row = row_array
    @headers = headers
  end
end

csv = RubyCsv.new
csv.each {|row| puts row.one}
