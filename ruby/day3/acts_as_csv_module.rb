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
    num = nil
    i = 0
    while i < @headers.length
      num = i if name.to_s == @headers[i].to_s
      i = i + 1
    end
    
    if num.nil?
      nil
    else
      @row[num]
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
