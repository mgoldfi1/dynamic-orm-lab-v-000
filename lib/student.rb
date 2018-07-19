require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord
  self.column_names.each do |col|
    attr_accessor col.to_sym
  end

  def self.find_by_name(hi)
    sql = "SELECT * FROM #{self.table_name} WHERE name = #{hi}"
    DB[:conn].execute(sql)
  end


end
