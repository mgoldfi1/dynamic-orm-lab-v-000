require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord
  self.column_names.each do |col|
    attr_accessor col.to_sym
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM ? WHERE name = ?"
    DB[:conn].execute(sql,self.table_name,name)
  end


end
